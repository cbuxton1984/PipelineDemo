terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "cb-tfstates"
        storage_account_name = "tfstate4kl0e"
        container_name       = "tfstates"
        key                  = "pipelinedemo.tfstate"
    }

}

provider "azurerm" {
  features {}
}

module "rg" {
  source = "./modules/rg"
  rg_name = var.rg_name
  rg_location = var.location
  rg_tags = var.tags
}

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
  tags = var.tags
}