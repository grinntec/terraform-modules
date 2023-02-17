module "azurerm_subnet" {
  source = "github.com/grinntec/terraform-modules/azure/azure_subnet/module"

  rg_name           = var.rg_name
  rg_location       = var.rg_location
  environment       = var.environment
  subscription_name = var.subscription_name
  address_space     = var.address_space
  subnet_name       = var.subnet_name
  address_prefixes  = var.address_prefixes
}