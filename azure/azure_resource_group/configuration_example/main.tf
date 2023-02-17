module "azurerm_resource_group" {
  source = "github.com/grinntec/terraform-modules/azure/azure_resource_group/module"

  rg_name           = var.rg_name
  rg_location       = var.rg_location
  environment       = var.environment
}