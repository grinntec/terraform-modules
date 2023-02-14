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

variable "subscription_name" {
  description = "Name of the subscription"
  type        = string
}

variable "address_space" {
    description = "The address space of the vnet"
    type = list
}
