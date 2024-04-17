resource "azurerm_network_interface" "windows_nic" {
  for_each = var.windows_name

  name                = "${each.key}-nic"
  resource_group_name = var.windows_rg
  location            = var.location

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[each.key].id
  }
}

resource "azurerm_public_ip" "windows_pip" {
  for_each = var.windows_name

  name                = "${each.key}-pip"
  resource_group_name = var.windows_rg
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-label"
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each              = var.windows_name
  name                  = each.key
  resource_group_name   = var.windows_rg
  location              = var.location
  size                  = var.windows_name[each.key] 
  availability_set_id   = azurerm_availability_set.windows_avset.id
  network_interface_ids = [azurerm_network_interface.windows_nic[each.key].id]
  computer_name         = each.key
  admin_username        = var.w_admin_username
  admin_password        = var.w_admin_password
  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = var.w_caching
    storage_account_type = var.w_storage_account_type
    disk_size_gb         = var.w_disk_size
  }

  source_image_reference {
    publisher = var.w_os_publisher
    offer     = var.w_os_offer
    sku       = var.w_os_sku
    version   = var.w_os_version
  }

  winrm_listener {
    protocol = "Http"
  }
}


#Define a new resource block for availability set with 2 fault domains and 5 update domains.
#deploy more instances to fail safe
resource "azurerm_availability_set" "windows_avset" {
  name                         = var.windows_avs
  resource_group_name          = var.windows_rg
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

