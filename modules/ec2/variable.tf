variable "ami_id" {
    description = "same ami id for ubuntu image"
    type = string
}

variable "instance_type" {
    description = "type of instance"
    type = string

}

variable "vpc_id" {
    description = "vpc id from module vpc"
    type = string

}

variable "sg_id" {
    description = "vpc id from module vpc"
          type = string
   


}
variable "subnet_id" {
    description = "vpc id from module vpc"
    type = list(string)
}

variable "public_subnet" {
  description = "subnet id inside cidr"
  type = list(string)
}
