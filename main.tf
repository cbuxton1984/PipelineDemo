
# Resource Group

module "rg" {
  source = "./modules/rg"
  rg_name = var.rg_name
  rg_location = var.location
  rg_tags = var.tags
}

# Networking

module "vnet" {
  source = "./modules/vnet"
  vnet_name = var.vnet_name
  location = module.rg.rg_location
  rg_name = module.rg.rg_name
  vnet_address_space = var.vnet_address_space
  tags = var.tags
}

module "subnet" {
  source = "./modules/subnet"
  subnet_name = var.subnet_name
  vnet_name = module.vnet.vnet_name
  rg_name = module.rg.rg_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "publicip" {
  source = "./modules/public_ip"
  pi_name = "cb-win-1-publicip"
  allocation_method = "Static"
  location = module.rg.rg_location
  rg_name = module.rg.rg_name
  tags = var.tags
}

# Workspaces

module "log_analytics" {
  source = "./modules/log_analytics"
  la_name = var.la_name
  location = module.rg.rg_location
  rg_name = module.rg.rg_name
  la_sku = var.la_sku
  la_retention = var.la_retention
  tags = var.tags
}

module "automation_account" {
  source = "./modules/automation_account"
  aa_name = var.aa_name
  location = module.rg.rg_location
  rg_name = module.rg.rg_name
  aa_sku = var.aa_sku
  la_id = module.log_analytics.la_id
  tags = var.tags
}

module "updatemanagement" {
  source = "./modules/updatemanagement"
  solution_name = var.um_solution_name
  location = var.location
  rg_name = var.rg_name
  la_id = module.log_analytics.la_id
  la_name = module.log_analytics.la_name
}

# Virtual Machines

module "windows_vm" {
  source ="./modules/win_vm_with_la_agent"
  vm_name = "cb-win-1"
  location = module.rg.rg_location
  rg_name = module.rg.rg_name
  vm_size = "Standard_B1s"
  vm_user = "chris"
  vm_pass = "n_Q`!$PkvNR+6YVW"
  os_sku = "2019-Datacenter"
  os_version = "latest"
  subnet_id = module.subnet.subnet_id
  publicip_id = module.publicip.publicip_id
  tags = var.tags
  la_workspace_id = module.log_analytics.la_workspace_id
  la_primary_shared_key = module.log_analytics.la_primary_shared_key
}