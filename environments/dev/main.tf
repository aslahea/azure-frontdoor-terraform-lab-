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

module "frontdoor" {
  source                  = "../../modules/frontdoor"
  frontdoor_profile_name  = var.frontdoor_profile_name
  frontdoor_endpoint_name = var.frontdoor_endpoint_name
  resource_group_name     = module.resource_group.name
  backend_address         = module.web_app.default_hostname
  tags                    = var.tags
}

