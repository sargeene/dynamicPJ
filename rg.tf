resource "azurerm_resource_group" "this_rg" {
  name     = "${local.owner}-${local.environment}-${var.rg_name}"
  location = var.location
  tags     = local.tags
}