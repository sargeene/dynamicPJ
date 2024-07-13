resource "azurerm_virtual_network" "this_vnet" {
  name                = "${local.owner}-${var.virtual_network}-${local.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name
}