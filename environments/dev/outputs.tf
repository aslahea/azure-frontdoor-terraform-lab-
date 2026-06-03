output "resource_group_name" {
  value       = module.resource_group.name
  description = "The name of the resource group"
}

output "resource_group_location" {
  value       = module.resource_group.location
  description = "The location of the resource group"
}
