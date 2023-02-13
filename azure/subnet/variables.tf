variable "name" {
    description     = "Name of the resource"
    type            = string
}

variable "location" {
    description     = "Azure location of the resource group"
    type            = string
}

variable "environment" {
    description     = "Prod, Test, Dev"
    type            = string
}
