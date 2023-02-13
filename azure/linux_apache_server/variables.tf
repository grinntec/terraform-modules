variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "name" {
  description = "Name of the application"
  type        = string
}

variable "location" {
  description = "Azure location of the resource group"
  type        = string
}

variable "environment" {
  description = "Prod, Test, Dev"
  type        = string
}
