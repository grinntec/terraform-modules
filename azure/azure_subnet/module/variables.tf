variable "rg_name" {
  description = "Name of the resource"
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

variable "subnet_name" {
  description = "Prod, Test, Dev"
  type        = string
}

variable "subscription_name" {
  description = "Prod, Test, Dev"
  type        = string
}

variable "address_prefixes" {
  description = "Address CIDR block"
  type        = list(any)
}