provider "aws" {
region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2"
  ami = var.ami
  subnet_id = var.subnet_id
  instance_type = lookup(var.instance_type,terraform.workspace,"t2.micro")
}