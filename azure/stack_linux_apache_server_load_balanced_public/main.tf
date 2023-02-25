// LOCALS
//-------

locals {
  tags = {
    env = var.environment
  }
}


// DATA SOURCES
//-------------

# Get the subnet details
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name_vnet
}

// RESOURCES
//----------

# Generate random text for a unique name for the resources
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

# Create a network interface card and assign an IP from the subnet in the variable
resource "azurerm_network_interface" "nic" {
  name                = "nic_${lower(random_id.random_id.hex)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "private"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
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
  name                = "vm${random_id.random_id.hex}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  
  # Attach the NIC with the private IP created earlier
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  # Create the OS disk
  os_disk {
    name                 = "os_disk_${random_id.random_id.hex}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Use the public machine image
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

# Create a public IP for load balancer
resource "azurerm_public_ip" "pip_public_lb" {
  name                = "PublicIPForLB"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  tags                = local.tags
}

# Create a load balancer and attach the public IP to front end
resource "azurerm_lb" "public_lb" {
  name                = "LoadBalancerPublic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip_public_lb.id
  }
  tags = local.tags
}

# Create a health probe for the backend pool VM
resource "azurerm_lb_probe" "http_inbound_probe" {
  loadbalancer_id = azurerm_lb.public_lb.id
  name            = "http_inbound_probe"
  port            = var.health_probe_port
}

# Create a bBackend address pool
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.public_lb.id
  name            = "backend_pool"
}

# Add a virtual machine NIC to the backend pool
resource "azurerm_network_interface_backend_address_pool_association" "bep_association" {
  network_interface_id    = azurerm_network_interface.nic.id
  ip_configuration_name   = "private"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

# Create Load balancing rules
resource "azurerm_lb_rule" "public_lb_inbound_rules" {
  loadbalancer_id                = azurerm_lb.public_lb.id
  name                           = "inbound_rule_http"
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.http_inbound_probe.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.backend_pool.id}"]
}