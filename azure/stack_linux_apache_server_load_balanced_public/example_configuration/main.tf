module "stack_linux_apache_server_load_balanced_public" {
  source = "github.com/grinntec/terraform-modules/azure/stack_linux_apache_server_load_balanced/"

  rg_name           = var.rg_name
  rg_location       = var.rg_location
  environment       = var.environment
  subnet_name       = var.subnet_name
  vnet_name         = var.vnet_name
  rg_name_vnet      = var.rg_name_vnet
  name              = var.name
  frontend_port     = var.frontend_port
  backend_port      = var.backend_port
  health_probe_port = var.health_probe_port
}
