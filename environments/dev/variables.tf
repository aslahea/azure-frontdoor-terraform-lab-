variable "project" {
  type        = string
  description = "The project name prefix for resources"
  default     = "fdlab"
}

variable "environment" {
  type        = string
  description = "The deployment environment name"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created"
  default     = "eastus"
}
