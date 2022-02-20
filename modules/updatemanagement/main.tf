resource "azurerm_log_analytics_solution" "updatemanagement" {
  solution_name = var.solution_name
  location = var.location
  resource_group_name = var.rg_name
  workspace_resource_id = var.la_id
  workspace_name = var.la_name
  plan {
      publisher = "Microsoft"
      product = "OMSGallery/Updates"
  }
}