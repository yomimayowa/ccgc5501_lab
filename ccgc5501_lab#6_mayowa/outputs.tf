output "network_resource_group" {
  value = module.resource_groups.network_rg
}

output "linux_resource_group" {
  value = module.resource_groups.linux_rg
}

output "windows_resource_group" {
  value = module.resource_groups.windows_rg
}

output "location" {
  value = module.resource_groups.location
}

#--------------------------------net work------------------------------
output "vnet" {
  value = module.network_module.vnet
}

output "vnet_address_space" {
  value = module.network_module.vnet_address_space
}

output "subnet1" {
  value = module.network_module.subnet1
}

output "subnet1_address_prefix" {
  value = module.network_module.subnet1_address_prefix
}

output "subnet2" {
  value = module.network_module.subnet2
}

output "subnet2_address_prefix" {
  value = module.network_module.subnet2_address_prefix
}

output "nsg1" {
  value = module.network_module.nsg1
}

output "nsg2" {
  value = module.network_module.nsg2
}


# Update the root module’s outputs.tf file to include the 
# hostnames, FQDNs, and private and public IP addresses 
# for Linux virtual machines.
output "linux_vms_hostnames" {
  value = module.linux_vm_module.vm_hostname
}

output "linux_vms_fqdns" {
  value = module.linux_vm_module.vm_fqdn
}

output "linux_vms_private_ip_address" {
  value = module.linux_vm_module.private_ip_address
}

output "linux_vms_public_ip_address" {
  value = module.linux_vm_module.private_ip_address
}


# Update the root module’s outputs.tf file to include the
#  hostnames, FQDNs, and private and public IP addresses 
#  for Windows virtual machines.
output "windows_vm_hostnames" {
  value = module.windows_vms.vm_hostnames
}

output "windows_vm_private_ips" {
  value = module.windows_vms.vm_private_ips
}

output "windows_vm_public_ips" {
  value = module.windows_vms.vm_public_ips
}

