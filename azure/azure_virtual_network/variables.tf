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
  type        = list(any)
}

/*variable "subnet_name" {
  description = "Name of the subscription"
  type        = string
}

variable "address_prefixes" {
  description = "Name of the subscription"
  type        = list(any)
}*/

variable "subnets" {
  type = map(any)
  default = {
    subnet_01 = {
      name             = "subnet_01"
      address_prefixes = ["10.123.1.0/24"]
    }
    subnet_02 = {
      name             = "subnet_02"
      address_prefixes = ["10.123.2.0/24"]
    }
  }
}
