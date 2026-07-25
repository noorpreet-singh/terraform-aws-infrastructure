variable "security_group" {
    description = "security grp"
}

variable "subnet_id" {
    description = "vpc id from module vpc"
    type = list(string)
}
variable "vpc_id" {
    description = "one main vpc id"
    type = string
}

variable "server1" {
    type = string
}
variable "server2" {
    type = string
}

variable "port" {
    description = "where all ALB links hits"
    type = string
}
variable "protocol" {
  description = "protocol/service as per port number"
  type = string
}

variable "lb_type" {
    description = "load balancer type"
    type = string
}

variable "alb_name" {
    type = string
}
variable "log_bucket_name" {
    type = string
}
