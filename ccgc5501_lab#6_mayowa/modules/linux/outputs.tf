output "vm_hostname" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}

output "vm_fqdn" {
  value = azurerm_public_ip.linux_pip[*].fqdn
}

output "private_ip_address" {
  value = azurerm_network_interface.linux_nic[*].private_ip_address
}

output "public_ip_address" {
  value = azurerm_public_ip.linux_pip[*].ip_address
}

output "linux_availability_set_name" {
  value = azurerm_availability_set.linux_avset.name
}
