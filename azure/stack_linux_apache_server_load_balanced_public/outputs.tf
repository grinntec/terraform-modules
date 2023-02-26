# Load balancer Public IP
output "lb_public_ip_address" {
  description = "Web Load Balancer Public Address"
  value = azurerm_public_ip.pip_public_lb.ip_address
}