# Terraform EC2 Instance Setup

This Terraform project sets up an EC2 instance on AWS, generates an RSA private key, and provides instructions for manual SSH access.

## Prerequisites

- [Terraform](https://www.terraform.io/) installed on your machine.
- AWS credentials configured on your machine.

## Configuration

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/terraform-ec2-instance.git
    cd terraform-ec2-instance
    ```

2. Create a `terraform.tfvars` file and set the required variables:

    ```hcl
    pem_file_name    = "private_key.pem"
    aws_keypair_name = "your-keypair-name"
    ami              = "ami-xxxxxxxxxxxxxxxxx"  # Specify your desired AMI ID
    instance_type    = "t2.micro"                # Specify your desired instance type
    subnet_id        = "subnet-xxxxxxxxxxxxxxxxx"  # Specify your desired subnet ID
    ```

3. Run Terraform commands:

    ```bash
    terraform init
    terraform apply
    ```

    Follow the on-screen prompts to confirm the changes.

4. Access the EC2 instance:

    - Once the `terraform apply` command completes, use the generated private key (`private_key.pem`) to SSH into the EC2 instance:

      ```bash
      ssh -i private_key.pem ec2-user@<instance-public-ip>
      ```

      Replace `private_key.pem` with the actual private key file name and `<instance-public-ip>` with the public IP address of the EC2 instance.

## Cleanup

After you have finished using the EC2 instance, you can run the following command to destroy the AWS resources:

```bash
terraform destroy

Follow the on-screen prompts to confirm the destruction.

Note: Be cautious while using terraform destroy as it will terminate the EC2 instance and remove associated resources.


