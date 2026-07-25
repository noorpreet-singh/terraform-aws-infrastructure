resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr

  tags = {
    Name = var.project_name
  }
}

resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.my_vpc.id

  count = length(var.public_subnet)  
  cidr_block = var.public_subnet[count.index]

  availability_zone = var.azs[count.index]

  map_public_ip_on_launch = true
  tags = {
    Name = "subnets-by-tf"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.my_vpc.id

}


resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my_vpc.id

   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

resource "aws_route_table_association" "rt_asso" {
  count          = length(aws_subnet.subnets)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.my-rt.id
}




resource "aws_security_group" "my_sg" {
  name        = "tf-connect-alb"
  description = "Allow 2 inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "scrtyGrp-terraform"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description =  "allow http traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow shell connection"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
