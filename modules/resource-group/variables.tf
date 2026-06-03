variable "project" {
  type        = string
  description = "The project name prefix for resources"
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, staging, prod)"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created"
}
