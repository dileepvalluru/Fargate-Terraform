#Creating a custom VPC in addition to the default vpc
resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform_vpc"
  }
}