variable "resource_group_name" {
  type        = string
  description = "Azure Resource Group Name"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created"
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resources"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the App Service Plan"
}

variable "web_app_name" {
  type        = string
  description = "Name of the Web App"
}