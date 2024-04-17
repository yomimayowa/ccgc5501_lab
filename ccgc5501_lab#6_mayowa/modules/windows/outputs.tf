# Define output blocks for Windows virtual machines
#  (availability set, virtual machines, private IP addresses, and public IP addresses)
#   in modules/windows/outputs.tf file.

output "vm_hostnames" {
  value = { for vm in azurerm_windows_virtual_machine.windows_vm : vm.name => vm.computer_name }
}

output "vm_private_ips" {
  value = { for nic in azurerm_network_interface.windows_nic : nic.name => nic.ip_configuration[0].private_ip_address }
}

output "vm_public_ips" {
  value = { for pip in azurerm_public_ip.windows_pip : pip.name => pip.ip_address }
}

output "availability_set_name" {
  value = azurerm_availability_set.windows_avset.name
}