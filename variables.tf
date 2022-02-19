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

variable "rgname" {
    type = string
    description = "Resource group name"
}

