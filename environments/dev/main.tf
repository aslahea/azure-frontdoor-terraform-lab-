module "resource_group" {
  source   = "../../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# The following modules will be added as configuration is developed:
# - module "web_app"
# - module "frontdoor"
# - module "monitoring"
