# General

location = "uksouth"

tags = {
    Environment = "Test"
    Owner = "Chris"
}

# Resource Group

rg_name = "cb-update-demo"

# Virtual Network

vnet_name = "cb-vnet"

vnet_address_space = ["10.69.0.0/16"]

# Subnet

subnet_name = "cb-subnet"

subnet_address_prefixes = ["10.69.1.0/24"]

# Log Analytics

la_name = "cb-la"

la_sku = "PerGB2018"

la_retention = 30

# Automation Account

aa_name = "cb-automation"

aa_sku = "Basic"

# Update Management

um_solution_name = "CB-UpdateMgmt"
