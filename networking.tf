resource "azurerm_subnet" "this_subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.this_rg.name
  virtual_network_name = azurerm_virtual_network.this_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "this_nic" {
  # If for_each is used as  below, then each.key is most appropriate
  #for_each            = toset(["rasheed", "onas"])
  #name                = "nic-for-${each.key}"
  #    N.B
  # each.key is used when there is a need to create a key specific to a user. 
  # It needs to be unique for each VM, and the key will provide a unique identifier.
  # each.value is used when refering directly to the name stated in the username.
  # The value in the map (i.e [rasheed", "onas"]) represents the username.


  for_each            = toset(var.usernames)
  name                = "nic-for-${each.value}"
  location            = azurerm_resource_group.this_rg.location
  resource_group_name = azurerm_resource_group.this_rg.name

  ip_configuration {
    name                          = "ip-config"
    subnet_id                     = azurerm_subnet.this_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this_publicip[each.key].id
  }
}
resource "azurerm_public_ip" "this_publicip" {
  for_each            = toset(var.usernames)
  name                = "public-ip-for-${each.value}"
  resource_group_name = azurerm_resource_group.this_rg.name
  location            = azurerm_resource_group.this_rg.location
  allocation_method   = "Static"

  tags = local.tags
}