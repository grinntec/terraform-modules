///
//LOCALS
//

locals {
  tags = {
    env = var.environment
  }
}

///
//RESOURCES
//

#Create public IP for load balancer
resource "azurerm_public_ip" "pip_public_lb" {
  name                = "PublicIPForLB"
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  tags                = local.tags
}

#Create load balancer and attached public IP to front end
resource "azurerm_lb" "public_lb" {
  name                = "PublicLoadBalancer"
  location            = var.rg_location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.pip_public_lb.id
  }
  tags = local.tags
}

#Create Load balancing rules
resource "azurerm_lb_rule" "public_lb_inbound_rules" {
  loadbalancer_id                = azurerm_lb.public_lb.id
  resource_group_name            = var.rg_name
  name                           = "inbound_rule_http"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.http_inbound_probe.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.business-backend-pool.id}"]


}

#Create Probe
resource "azurerm_lb_probe" "http_inbound_probe" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.public_lb.id
  name                = "http_inbound_probe"
  port                = 80
}
