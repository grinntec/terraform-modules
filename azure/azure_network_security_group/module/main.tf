///
// LOCALS
///
locals {
  tags = {
    env = var.environment
  }
}

///
// DATA SOURCE
///
data "azurerm_subnet" "subnet" {
  name = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name = var.rg_name
}

///
// RESOURCES
///

# Create network security group
resource "azurerm_network_security_group" "nsg" {
  name                = "nsg"
  location            = var.rg_location
  resource_group_name = var.rg_name

  tags = local.tags
}

# Associate the network security group with the subnet
resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# Create network security group rule
resource "azurerm_network_security_rule" "nsg-rule" {
  name                        = var.nsg_rule_name
  priority                    = var.nsg_rule_priority
  direction                   = var.nsg_rule_direction
  access                      = var.nsg_rule_access
  protocol                    = var.nsg_rule_protocol
  source_port_range           = "*"
  destination_port_range      = var.nsg_rule_destination_port
  source_address_prefix       = var.nsg_rule_source
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
/*# Create network security group rule
resource "azurerm_network_security_rule" "nsg-rule" {
  name                        = "rule01"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "185.203.216.232" # You need to use your connecting system public IP address, use ipchicken.com
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}*/
