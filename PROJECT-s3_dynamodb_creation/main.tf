/*Using this project we will just create s3 and dynamodb table. For remote s3 backend we need s3
bucket and dynamodb table already created. So in that seperate project we will only create 
ec2 instance and we will run that project after this project is successfully completed and s3 bucket
and dynamodb table is created*/

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "s3_rbe_bucket" {
  bucket = var.s3_bucket_name
}

/*Each entry created in dynamo db will have hashKey/primaryKey. It will be assigned  
to the variable named lockID. This value will be internally sent by terraform. Terraform will 
take care of implementing lock. You just make sure a dynamodb table is created and it accepts a
primary key of type string*/

resource "aws_dynamodb_table" "terraform_lock" {
  name             = var.dynamodb_table_name
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

