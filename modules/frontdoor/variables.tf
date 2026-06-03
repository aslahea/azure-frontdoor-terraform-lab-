variable "frontdoor_profile_name" {
  description = "Azure Front Door Profile Name"
  type        = string
}

variable "frontdoor_endpoint_name" {
  description = "Azure Front Door Endpoint Name"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "backend_address" {
  description = "The address of the backend Web App (e.g., myapp.azurewebsites.net)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
