module "azurerm_virtual_network" {
  source = "github.com/grinntec/terraform-modules/azure/azure_virtual_network/module"

  rg_name           = var.rg_name
  rg_location       = var.rg_location
  environment       = var.environment
  subscription_name = var.subscription_name
  address_space     = var.address_space
  #subnet_name       = var.subnet_name
  #address_prefixes  = var.address_prefixes
  #subnets = var.subnets
}