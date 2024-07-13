resource "azurerm_user_assigned_identity" "this_asigned_identity" {
  location            = azurerm_resource_group.this_rg.location
  name                = "kv-identity"
  resource_group_name = azurerm_resource_group.this_rg.name
}

resource "azurerm_role_assignment" "this_role_assignment" {
  scope                = azurerm_key_vault.this_keyvault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azurerm_user_assigned_identity.this_asigned_identity.principal_id
  depends_on           = [azurerm_user_assigned_identity.this_asigned_identity]
}