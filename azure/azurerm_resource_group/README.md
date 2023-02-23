# azure-resource-group (module)

## Terraform azurerm resources
[azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)

[azurerm_management_lock](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock)

## `azurem_resource_group`

### Name
- Is made up of variable values
- {uai}-{appName}-{environment}-rg

### Location
- Choose from `west europe` `east us` or `southeast asia`

## `azurerm_management_lock`
A `CanNotDelete` is applied meaning the resource group and any resources within cannot be deleted.
