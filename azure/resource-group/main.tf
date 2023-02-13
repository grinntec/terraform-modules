resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.appName}-${var.environment}"
  location = var.location
  tags     = local.tags
}

#resource "azurerm_management_lock" "lock" {
#  name       = "noDelete"
#  scope      = azurerm_resource_group.this.id
#  lock_level = "CanNotDelete"
#  notes      = "This RG and resources within are locked from deletion"
#}

locals {
  tags = {
    appname     = var.appName
    env         = var.environment
    created_by  = var.created_by  
    }
}
