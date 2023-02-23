resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.rg_name}"
  location = var.rg_location
  tags     = local.tags
}

locals {
  tags = {
    env         = var.environment
    }
}

