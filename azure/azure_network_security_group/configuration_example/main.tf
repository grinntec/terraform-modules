module "azurerm_virtual_network" {
  source = "github.com/grinntec/terraform-modules/azure/azure_network_security_group/module"

  rg_name           = var.rg_name
  rg_location       = var.rg_location
  environment       = var.environment
  subnet_name       = var.subnet_name
}