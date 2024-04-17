
variable "vnet" {
}


variable "vnet_address" {
}

variable "subnet1" {
}

variable "subnet1_address" {
}

variable "subnet2" {
}

variable "subnet2_address" {
}

variable "nsg1" {
}

variable "nsg2" {
}

variable "location" {
}
variable "network-rg" {
}

variable "subnet1_nsg_id" {
  description = "The ID of the network security group associated with subnet1."
  type        = string
}

variable "subnet2_nsg_id" {
  description = "The ID of the network security group associated with subnet2."
  type        = string
}


