variable "ami" {
  description = "Value of ami"
}
variable "instance_type" {
  description = "Value of instance type"
}
variable "role_id" {
  description = "Value of role id used to authenticate with vault"
}
variable "secret_id" {
  description = "Value of secret id used to authenticate with vault"
}
variable "mount_path" {
  description = "Value of mount path for secret key in vault"
}
variable "secret_name" {
  description = "Value of the secret key name in vault"
}