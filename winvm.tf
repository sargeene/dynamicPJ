

resource "azurerm_windows_virtual_machine" "this_win_vm" {
   for_each            = toset(var.usernames)
  name                = "vm-for-${each.key}"
  computer_name       = "vm-${each.key}"
  resource_group_name = azurerm_resource_group.this_rg.name
  location            = azurerm_resource_group.this_rg.location
  size                = "Standard_F2"
  admin_username      = each.value
  admin_password      = azurerm_key_vault_secret.this_vm_secret[each.key].value
  network_interface_ids = [
    azurerm_network_interface.this_nic[eack.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}