output "network_rg" {
  value = azurerm_resource_group.network-rg.name
}

output "linux_rg" {
  value = azurerm_resource_group.linux-rg.name
}

output "windows_rg" {
  value = azurerm_resource_group.windows-rg.name
}

output "location" {
  value = var.location
}
