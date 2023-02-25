<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsg-rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet_network_security_group_association.nsg-association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Prod, Test, Dev | `string` | n/a | yes |
| <a name="input_nsg_rule_access"></a> [nsg\_rule\_access](#input\_nsg\_rule\_access) | Allow or deny of the NSG rule | `string` | n/a | yes |
| <a name="input_nsg_rule_destination_port"></a> [nsg\_rule\_destination\_port](#input\_nsg\_rule\_destination\_port) | Destination port of the NSG rule | `string` | n/a | yes |
| <a name="input_nsg_rule_direction"></a> [nsg\_rule\_direction](#input\_nsg\_rule\_direction) | Direction of the NSG rule | `string` | n/a | yes |
| <a name="input_nsg_rule_name"></a> [nsg\_rule\_name](#input\_nsg\_rule\_name) | Name of the NSG rule | `string` | n/a | yes |
| <a name="input_nsg_rule_priority"></a> [nsg\_rule\_priority](#input\_nsg\_rule\_priority) | Priority of the NSG rule | `string` | n/a | yes |
| <a name="input_nsg_rule_protocol"></a> [nsg\_rule\_protocol](#input\_nsg\_rule\_protocol) | Procotol of the NSG rule | `string` | n/a | yes |
| <a name="input_nsg_rule_source"></a> [nsg\_rule\_source](#input\_nsg\_rule\_source) | Source of the NSG rule | `string` | n/a | yes |
| <a name="input_rg_location"></a> [rg\_location](#input\_rg\_location) | Location of the resource group | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name of the subscription | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the subscription | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->