
output "vpc" {
    value = aws_vpc.my_vpc.id
    type = string
}

output "security_group_id" {
    value = aws_security_group.my_sg.id
    type = string
}

output "subnet_id" {
    value = aws_subnet.subnets[*].id
    type = list(string)
}


