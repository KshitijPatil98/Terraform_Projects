terraform {
  backend "s3" {
    bucket         = "kshitij-rbe-bucket" 
    key            = "kshitij/terraform.tfstate" #This will create a new folder name kshitij inside root folder and the state file will be stored inside it
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}