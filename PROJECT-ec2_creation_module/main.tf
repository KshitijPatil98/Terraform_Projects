provider "aws" {
    region = "us-east-1"
}

module "ec2_module" {
source = "../PROJECT-simple_ec2-creation"
ami = var.ami
instance_type = var.instance_type
subnet_id = var.subnet_id
}


