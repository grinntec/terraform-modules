variable "location" {
  description = "The loaction of the VNET"
}


//Application
variable "appName" {
    description     = "Name of the application"
    type            = string
}

variable "environment" {
    description     = "Type of environment; PROD or DEV"
    type            = string
}

variable "created_by" {
    description     = "Name of who created the resource"
    type            = string
}
