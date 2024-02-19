variable "ami" {
  description = "The ami id"
}
variable "subnet_id" {
  description = "The subnet id"
}
variable "instance_type" {
  description = "The size of the instance"
}

variable "pem_file_name" {
  description = "The name of the pem file which we will store locally and use to ssh in our instance"
} 

variable "aws_keypair_name" {
  description = "The name of the aws key pair "
}