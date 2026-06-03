module "resource_group" {
  source   = "../../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "web_app" {
  source                = "../../modules/web-app"
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  app_service_plan_name = var.app_service_plan_name
  web_app_name          = var.web_app_name
  tags                  = var.tags
}

# The following modules will be added as configuration is developed:
# - module "frontdoor"
# - module "monitoring"
