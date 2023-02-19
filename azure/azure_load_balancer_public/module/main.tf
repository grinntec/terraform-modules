///
//LOCALS
//

locals {
  tags = {
    env = var.environment
  }
}

///
// DATA SOURCES
///

#Get the NIC ID from a provided NIC
data "azurerm_network_interface" "vm_nic" {
  name                = var.nic_id
  resource_group_name = var.rg_name
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
  name                = "LoadBalancerPublic"
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
  name                           = "inbound_rule_http"
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.baclendtend_port
  frontend_ip_configuration_name = "PublicIPAddress"
  probe_id                       = azurerm_lb_probe.http_inbound_probe.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.backend_pool.id}"]
}

#Create Probe
resource "azurerm_lb_probe" "http_inbound_probe" {
  loadbalancer_id = azurerm_lb.public_lb.id
  name            = "http_inbound_probe"
  port            = var.health_probe_port
}

#Create Backend Address Pool
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.public_lb.id
  name            = "backend_pool"
}

#Add a virtual machine NIC to the backend pool
resource "azurerm_network_interface_backend_address_pool_association" "bep_association" {
  network_interface_id    = data.azurerm_network_interface.vm_nic.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}
