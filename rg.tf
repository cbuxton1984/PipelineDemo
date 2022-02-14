resource "azurerm_resource_group" "cb-rg" {
  name     = var.rgname
  location = var.location
}