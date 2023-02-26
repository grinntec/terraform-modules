variable "rg_name" {
  description = "Name of the resource group where the workload will be stored"
  type        = string
}

variable "rg_location" {
  description = "Location of the resource group where the workload will be stored"
  type        = string
}

variable "environment" {
  description = "Set the workload environment type: Prod, Test, Dev"
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
  description = "Name of the workload"
  type        = string
}

variable "node_count" {
  description = "Number of VMs"
  type        = string
}