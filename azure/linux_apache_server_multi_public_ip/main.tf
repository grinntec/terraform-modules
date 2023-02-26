///
// LOCALS
///
locals {
  tags = {
    env = var.environment
  }
}

///
// DATA SOURCES
///

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name_vnet
}

///
// RESOURCES
///

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}

# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location

  tags = local.tags
}

# Create public IP address
resource "azurerm_public_ip" "pip" {
  count               = var.node_count
  name                = "pip_${lower(random_id.random_id.hex)}${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"

  tags = local.tags
}

# Create a network interface card and assign an IP from the subnet and attach the PIP
resource "azurerm_network_interface" "nic" {
  count               = var.node_count
  name                = "nic_${lower(random_id.random_id.hex)}${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.pip.*.id, count.index)
  }

  tags = local.tags
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "storage_account" {
  name                     = "diag${lower(random_id.random_id.hex)}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.node_count
  name                = "vm${random_id.random_id.hex}${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  network_interface_ids = [
    element(azurerm_network_interface.nic.*.id, count.index)
  ]

  os_disk {
    name                 = "os_disk_${random_id.random_id.hex}${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "vm${random_id.random_id.hex}"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage_account.primary_blob_endpoint
  }

  # This TPL file (template) is used to install Apache web server and setup a basic web page
  custom_data = filebase64("customdata.tpl") # Encodes file as base64 which is needed for custom_data functon

  tags = local.tags
}
