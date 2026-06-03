output "resource_group_name" {
  value       = module.resource_group.name
  description = "The name of the resource group"
}

output "resource_group_location" {
  value       = module.resource_group.location
  description = "The location of the resource group"
}

output "web_app_name" {
  value       = module.web_app.name
  description = "The name of the web app"
}

output "web_app_url" {
  value       = "https://${module.web_app.default_hostname}"
  description = "The URL of the web app"
}

output "frontdoor_endpoint" {
  value       = module.frontdoor.frontdoor_endpoint
  description = "The hostname of the Front Door endpoint"
}

