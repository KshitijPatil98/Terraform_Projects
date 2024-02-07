provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://127.0.0.1:8200"
   skip_child_token = true
  
  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.role_id
      secret_id = var.secret_id
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = var.mount_path // change it according to your mount
  name  = var.secret_name // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Username = data.vault_kv_secret_v2.example.data["Username"]
  }
}