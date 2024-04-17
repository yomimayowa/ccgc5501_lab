resource "azurerm_network_interface" "linux_nic" {
  count               = var.nb_count
  name                = "${var.linux_name}${format("%1d", count.index + 1)}-nic"
  resource_group_name = var.linux_rg
  location            = var.location
   # # depends_on          = [azurerm_subnet_network_security_group_association.subnet_nsg_association] 

  ip_configuration {
    name                          = "${var.linux_name}${format("%1d", count.index + 1)}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.linux_pip.*.id, count.index)
  }

  tags = {
    name         = "Terraform-Class"
    project      = "Learning"
    contactEmail = "n01658423@humber.ca"
    environment  = "Lab"
  }
}


resource "azurerm_public_ip" "linux_pip" {
  name                = "${var.linux_name}${format("%1d", count.index + 1)}-pip"
  resource_group_name = var.linux_rg
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.linux_name}${format("%1d", count.index + 1)}-dns"
  count               = var.nb_count
  tags = {
    name         = "Terraform-Class"
    project      = "Learning"
    contactEmail = "n01658423@humber.ca"
    environment  = "Lab"
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                            = "${var.linux_name}${format("%1d", count.index + 1)}"
  resource_group_name             = var.linux_rg
  location                        = var.location
  network_interface_ids           = [element(azurerm_network_interface.linux_nic[*].id, count.index + 1)]
  size                            = var.size
  computer_name                   = "${var.linux_name}${format("%1d", count.index + 1)}"
  admin_username                  = var.admin_username
  disable_password_authentication = true
  availability_set_id             = azurerm_availability_set.linux_avset.id
  depends_on                      = [azurerm_availability_set.linux_avset]
  count                           = var.nb_count

  os_disk {
    name                 = "${var.linux_name}${format("%1d", count.index + 1)}-os-disk"
    caching              = var.caching
    storage_account_type = var.storage_account_type
    disk_size_gb         = var.disk_size
  }

  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  tags = {
    name         = "Terraform-Class"
    project      = "Learning"
    contactEmail = "n01658423@humber.ca"
    environment  = "Lab"
  }
}

#Define a new resource block for availability set with 2 fault domains and 5 update domains.
#deploy more instances to fail safe
resource "azurerm_availability_set" "linux_avset" {
  name                         = "linux-avset"
  resource_group_name          = var.linux_rg
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}
