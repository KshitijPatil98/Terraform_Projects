/*Here we dont have terraform.tfvars for this project because we are creating a module. This module is 
used in another project which has a tfvars file*/

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
}

