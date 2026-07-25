


resource "aws_instance" "my-server1" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
 subnet_id =  var.subnet_id[0]
  user_data_base64 = base64encode(file("${path.module}/userdata1.sh"))
   key_name  = aws_key_pair.terraform_key.key_name

 
}
resource "aws_instance" "my-server2" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  subnet_id =  var.subnet_id[1]
  user_data_base64 = base64encode(file("${path.module}/userdata2.sh"))
  key_name  = aws_key_pair.terraform_key.key_name

 
}

resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-PRJT-key"
  public_key = file("${path.module}/prj-prvt-key.pub")
}

