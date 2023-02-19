variable "rg_name" {
  description = "Name of the application"
  type        = string
}

variable "rg_location" {
  description = "Azure location of the resource group"
  type        = string
}

variable "environment" {
  description = "Prod, Test, Dev"
  type        = string
}