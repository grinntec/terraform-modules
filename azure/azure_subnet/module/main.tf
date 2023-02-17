resource "azurerm_subnet" "subnet" {
  name                                          = var.subnet_name
  resource_group_name                           = var.rg_name
  virtual_network_name                          = "vnet-${var.subscription_name}"
  address_prefixes                              = var.address_prefixes
  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = true
}