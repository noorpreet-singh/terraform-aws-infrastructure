variable "project_name" {
    type = string
}

variable "cidr" {
    type = string
}

variable "azs" {
  type    = list(string)
}

variable "public_subnet" {
  type    = list(string)
}


