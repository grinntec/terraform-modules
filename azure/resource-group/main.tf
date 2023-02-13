resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name}"
  location = var.location
  tags     = local.tags
}

locals {
  tags = {
    env         = var.environment
    }
}
