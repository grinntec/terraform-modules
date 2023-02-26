variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "environment" {
  description = "Prod, Test, Dev"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "rg_name_vnet" {
  description = "Name of the resource group for the virtual network"
  type        = string
}

variable "name" {
  description = "Name of the application"
  type        = string
}