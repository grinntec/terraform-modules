/*# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}*/

/*# Create resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location

  tags = local.tags
}*/

# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.subscription_name}"
  resource_group_name = azurerm_resource_group.rg.name # By referencing the azurerm value it creates an implicit dependancy to the RG being created first
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space

  tags = local.tags
}

/*# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.123.1.0/24"]
}

# Create network security group
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.tags
}

# Associate the network security group with the subnet
resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create network security group rule
resource "azurerm_network_security_rule" "nsg-rule" {
  name                        = "rule01"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "185.203.216.208" # You need to use your connecting system public IP address, use ipchicken.com
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}*/
////////////////////////////////////////////////////////////////////////////////////////
// LOCALS
////////////////////////////////////////////////////////////////////////////////////////
locals {
  tags = {
    env = var.environment
  }
}

