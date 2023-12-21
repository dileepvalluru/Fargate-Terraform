#Creating an internet gateway for internet access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "main"
  }
}

