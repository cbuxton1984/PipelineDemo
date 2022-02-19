# General

variable "location" {
  type = string
  description = "Region for deployment"
}

variable "tags" {
  type = map
  description = "Tags"
}

# Resource Group

variable "rg_name" {
    type = string
    description = "Resource group name"
}

# Virtual Network

variable "vnet_name" {
      description = "vNet Name"
      type = string
}

variable "vnet_address_space" {
      description = "vNet Address Space"
      type = list
}

# Subnet

variable "subnet_name" {
      description = "Subnet Name"
      type = string
}

variable "subnet_address_prefixes" {
      description = "Subnet Prefixes"
      type = list
}

# Log Analytics

variable "la_name" {
      description = "Log Analytics Name"
      type = string
}

variable "la_sku" {
      description = "Log Analytics SKU"
      type = string
}

variable "la_retention" {
      description = "Log Analytics Retention"
      type = number
}

# Automation Account

 variable "aa_name" {
       description = "Automation Account Name"
       type = string
 }

variable "aa_sku" {
      description = "Automation Account SKU"
      type = string
}