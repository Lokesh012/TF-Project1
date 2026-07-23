resource "azurerm_network_security_group" "cv-nsg" {
    for_each = var.nsgs
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_names

      security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
      security_rule {
    name                       = "http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "http"
    source_port_range          = "80"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

        security_rule {
    name                       = "sql"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "http"
    source_port_range          = "1433"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "sub-nsg" {
    for_each = var.nsgs
    network_security_group_id = azurerm_network_security_group.cv-nsg.id
    subnet_id = data.azurerm_subnet.data_frontend_sub[each.key].id
}

resource "azurerm_subnet_network_security_group_association" "sub-nsg" {
    for_each = var.nsgs
    network_security_group_id = azurerm_network_security_group.cv-nsg.id
    subnet_id = data.azurerm_subnet.data_backend_sub[each.key].id
}

data "azurerm_subnet" "data_frontend_sub" {
  for_each = var.nsgs
  name = each.value.data_frontend_sub_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_subnet" "data_backend_sub" {
  for_each = var.nsgs
  name = each.value.data_backend_sub_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}