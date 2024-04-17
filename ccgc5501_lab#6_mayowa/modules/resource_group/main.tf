resource "azurerm_resource_group" "network-rg" {
  name     = var.network_rg
  location = var.location
}

resource "azurerm_resource_group" "windows-rg" {
  name     = var.windows_rg
  location = var.location
}

resource "azurerm_resource_group" "linux-rg" {
  name     = var.linux_rg
  location = var.location
}
