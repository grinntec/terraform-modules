resource "azurerm_public_ip" "pip_lb" {
  name                = "PublicIPForLB"
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  tags                = local.tags
}

resource "azurerm_lb" "lb" {
  name                = "LoadBalancer"
  location            = var.rg_location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
  tags = local.tags
}
locals {
  tags = {
    env = var.environment
  }
}
