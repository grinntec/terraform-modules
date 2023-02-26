module "linux_apache_server_single_public_ip" {
  source = "github.com/grinntec/terraform-modules/azure/linux_apache_server_single_public_ip"

  rg_name      = var.rg_name
  rg_location  = var.rg_location
  environment  = var.environment
  subnet_name  = var.subnet_name
  vnet_name    = var.vnet_name
  rg_name_vnet = var.rg_name_vnet
  name         = var.name
}
