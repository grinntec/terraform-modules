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

variable "nic_id" {
  description = "ID of the backend pool VM NIC"
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