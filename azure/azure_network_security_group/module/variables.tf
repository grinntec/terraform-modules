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

variable "nsg_rule_name"{
  description = "Name of the NSG rule"
  type = string
}

variable "nsg_rule_priority"{
  description = "Priority of the NSG rule"
  type = string
}

variable "nsg_rule_direction"{
  description = "Direction of the NSG rule"
  type = string
}

variable "nsg_rule_access"{
  description = "Allow or deny of the NSG rule"
  type = string
}

variable "nsg_rule_protocol"{
  description = "Procotol of the NSG rule"
  type = string
}

variable "nsg_rule_destination_port"{
  description = "Destination port of the NSG rule"
  type = string
}

variable "nsg_rule_source"{
  description = "Source of the NSG rule"
  type = string
}