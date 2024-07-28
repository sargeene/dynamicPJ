data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "this_keyvault" {
  name                       = var.kv_name
  location                   = azurerm_resource_group.this_rg.location
  resource_group_name        = azurerm_resource_group.this_rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = ["81.105.32.49"]
    virtual_network_subnet_ids = []
  }
  
}

resource "azurerm_key_vault_access_policy" "this_rasheed_access_policy" {
  key_vault_id = azurerm_key_vault.this_keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "e56f3662-0ea4-4e14-83a5-a1e4939aa208"

  secret_permissions = [
    "Set",
    "Get",
    "Delete",
    "List"
  ]
}

resource "azurerm_key_vault_secret" "this_vm_secret" {
  for_each     = toset(var.usernames)
  name         = "secret-for-${each.key}"
  value        = random_password.this_password[each.value].result
  key_vault_id = azurerm_key_vault.this_keyvault.id
}