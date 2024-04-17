output "vnet" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet1" {
  value = azurerm_subnet.subnet1
}

output "subnet1_address_prefix" {
  value = azurerm_subnet.subnet1.address_prefixes
}

output "subnet2" {
  value = azurerm_subnet.subnet2
}

output "subnet2_address_prefix" {
  value = azurerm_subnet.subnet2.address_prefixes
}

output "nsg1" {
  value = azurerm_network_security_group.nsg1.name
}

output "nsg2" {
  value = azurerm_network_security_group.nsg2.name
}

# Assuming network module outputs the NSG IDs with the following:
output "nsg1_id" {
  value = azurerm_network_security_group.nsg1.id
}

output "nsg2_id" {
  value = azurerm_network_security_group.nsg2.id
}