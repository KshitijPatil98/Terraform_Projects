provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "aws_ec2" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id 
}