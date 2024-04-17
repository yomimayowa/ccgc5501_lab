variable "windows_avs" {}

variable "windows_name" {}

variable "w_admin_username" {}

variable "w_admin_password" {}

variable "w_storage_account_type" {}

variable "w_disk_size" {}

variable "w_caching" {}

variable "w_os_publisher" {}

variable "w_os_offer" {}

variable "w_os_sku" {}

variable "w_os_version" {}

variable "w_nb_count" {}

variable "location" {
  description = "The Azure region where to deploy the resources."
}

variable "windows_rg" {
  description = "The name of the resource group where to deploy the Windows VMs."
}

variable "subnet_id" {
  description = "The ID of the subnet where the VMs will be connected."
}
