provider "aws" {
  region = "us-east-1"
}

#The block generates a private key. 
resource "tls_private_key" "tlspk" {
  algorithm = "RSA"
}

/*Below we are storing the private key into a file on our local machine 
We will use this pem file to ssh into our ec2 instance.*/
resource "local_file" "private_key_file" {
  content  = tls_private_key.tlspk.private_key_pem
  filename = var.pem_file_name
}

/*Below we will generate a key pair for our aws instance. This is basically a public key 
which we will associate with our aws instance. We will use the above generated 
private key to generate a public key*/
resource "aws_key_pair" "TfKeyPair" {
  key_name   = var.aws_keypair_name
  public_key = tls_private_key.tlspk.public_key_openssh
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = aws_key_pair.TfKeyPair.key_name

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from remote-exec provisioner' > /tmp/terraform_remote_exec_example.txt"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = tls_private_key.tlspk.private_key_pem
      host        = self.public_ip
    }
  }
  #We are providing access to the pem file because we will use to manually ssh into our ec2 instance.
  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private_key_file.filename}"
  }

}


