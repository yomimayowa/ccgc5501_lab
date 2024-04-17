module "resource_groups" {
  source     = "./modules/resource_group"
  network_rg = "network_rg"
  linux_rg   = "linux_rg"
  windows_rg = "windows_rg"
  location   = "Canada Central"
}

module "network_module" {
  source          = "./modules/network"
  vnet            = "vnet"
  vnet_address    = ["10.0.0.0/16"]
  subnet1         = "subnet1"
  subnet1_address = "10.0.1.0/24"
  subnet2         = "subnet2"
  subnet2_address = "10.0.2.0/24"
  nsg1            = "nsg1"
  nsg2            = "nsg2"
  location        = module.resource_groups.location
  network-rg      = module.resource_groups.network_rg

  # Add the NSG association for subnet1
  subnet1_nsg_id = module.network_module.nsg1_id

  # Add the NSG association for subnet2
  subnet2_nsg_id = module.network_module.nsg2_id
}

module "linux_vm_module" {
  source               = "./modules/linux"
  linux_name           = "n01658423-u-vm"
  size                 = "Standard_B1s"
  admin_username       = "admin_user"
  public_key           = "~/.ssh/id_rsa.pub"
  private_key          = "~/.ssh/id_rsa"
  storage_account_type = "Premium_LRS"
  disk_size            = 32
  caching              = "ReadWrite"
  os_publisher         = "Canonical"
  os_offer             = "UbuntuServer"
  os_sku               = "19.04"
  os_version           = "latest"
  linux_avs            = "linux_avs"
  nb_count             = 2
  linux_rg             = module.resource_groups.linux_rg
  location             = module.resource_groups.location
  subnet_id            = module.network_module.subnet1.id

}

module "windows_vms" {
  source      = "./modules/windows"
  windows_avs = "windows_avs"
  windows_name = {
    "n01658423-w-vm1" = "Standard_B1s"
    "n01658423-w-vm2" = "Standard_B1ms"
  }
  w_admin_username       = "admin_user"
  w_admin_password       = "Xyz@123!"
  w_storage_account_type = "StandardSSD_LRS"
  w_disk_size            = 128
  w_caching              = "ReadWrite"
  w_os_publisher         = "MicrosoftWindowsServer"
  w_os_offer             = "WindowsServer"
  w_os_sku               = "2016-Datacenter"
  w_os_version           = "latest"
  w_nb_count             = 2
  windows_rg             = module.resource_groups.windows_rg
  location               = module.resource_groups.location
  subnet_id              = module.network_module.subnet2.id
}


