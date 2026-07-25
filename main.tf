

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  cidr = var.vpc_cidr
  public_subnet = var.public_subnet_cidrs
  azs = var.azs
}


module "s3" {
  source = "./modules/s3"
  bucket_name_unique = "terraform-project-bucket-1.1"
  bucket_name = "My bucket from terraform"
}


module "ec2_instance" {
  source = "./modules/ec2"
  ami_id = "ami-01edba92f9036f76e"
  instance_type = "t3.micro"

  vpc_id = module.vpc.vpc
  sg_id = module.vpc.security_group_id
  subnet_id = module.vpc.subnet_id
  public_subnet = var.public_subnet_cidrs


}

module "loadBalancer" {
  source = "./modules/alb"

  log_bucket_name = module.s3.bucket_name

  security_group = module.vpc.security_group_id
  subnet_id = module.vpc.subnet_id
  vpc_id = module.vpc.vpc

  server1 = module.ec2_instance.instance1_id
  server2 = module.ec2_instance.instance2_id

  alb_name = "my-alb-terraform"
  lb_type = "application"
  port = "80"
  protocol = "HTTP"



}

