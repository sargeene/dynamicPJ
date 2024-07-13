resource "random_password" "this_password" {
  for_each         = toset(var.usernames)
  length           = 11
  lower            = true
  upper            = true
  special          = true
  min_upper        = 1
  min_lower        = 1
  min_special      = 1
  override_special = "!#$%&"
  depends_on       = [azurerm_key_vault.this_keyvault]
}