variable "ami" {
  description = "The value of ami"
}

variable "subnet_id" {
  description = "The value of subnet id"
}

variable "instance_type" {
  description = "The value of instance type"
  type = map(string)
}