module "resource_group" {
  source      = "../../modules/resource-group"
  project     = var.project
  environment = var.environment
  location    = var.location
}

# The following modules will be added as configuration is developed:
# - module "web_app"
# - module "frontdoor"
# - module "monitoring"
