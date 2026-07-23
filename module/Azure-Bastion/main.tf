resource "azurerm_bastion_host" "cv_bastion" {
    for_each = var.bastion
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.azurerm_resource_group
    sku = "Standard"
    ip_configuration {
        name = each.value.pip_name
        subnet_id =  data.azurerm_subnet.data-sub[each.key].id
        public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id   
    }  
}


data "azurerm_subnet" "data-sub" {
  for_each = var.bastion
  name = each.value.data_sub_name
  resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "data_pip" {
  for_each = var.bastion
  name = each.value.data_pip_name
  resource_group_name = each.value.resource_group_name
}

