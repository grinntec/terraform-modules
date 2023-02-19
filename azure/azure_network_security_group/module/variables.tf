variable "rg_name" {
  description = "Name of the resource"
  type        = string
}

variable "rg_location" {
  description = "Location of the resource group"
  type        = string
}

variable "environment" {
  description = "Prod, Test, Dev"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subscription"
  type        = string
}

variable "vnet_name" {
  description = "Name of the subscription"
  type        = string
}
