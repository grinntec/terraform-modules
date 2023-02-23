variable "rg_name" {
  description = "Name of the resource group hosting the workload"
  type = string
}

variable "rg_location" {
  description = "Location of the resource group hosting the workload"
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

variable "frontend_port" {
  description = "Listening port on the frontnend"
  type        = string
}

variable "backend_port" {
  description = "Listening port on the backendend"
  type        = string
}

variable "health_probe_port" {
  description = "Listening port on the backendend"
  type        = string
}