variable "rg_name" {
    description = "Resource Group Name"
    type  = string
}

variable "rg_location" {
    description = "Resource Group Location"
    type = string
}

variable "rg_tags" {
    description = "Resource Group Tags"
    type = map(string)
    default = {}
}