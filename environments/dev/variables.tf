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