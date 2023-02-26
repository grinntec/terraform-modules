<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.43.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_linux_apache_server_single_public_ip"></a> [linux\_apache\_server\_single\_public\_ip](#module\_linux\_apache\_server\_single\_public\_ip) | github.com/grinntec/terraform-modules/azure/linux_apache_server_single_public_ip/module | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Prod, Test, Dev | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the application | `string` | n/a | yes |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | n/a | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | n/a | `string` | n/a | yes |
| <a name="input_rg_name_vnet"></a> [rg\_name\_vnet](#input\_rg\_name\_vnet) | Name of the resource group for the virtual network | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subnet | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->