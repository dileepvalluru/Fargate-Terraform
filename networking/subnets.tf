#Getting the data of the available availability_zones
data "aws_availability_zones" "available" {
  state = "available"
}

#Creating public subnets in all the availability zones
resource "aws_subnet" "public" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.terraform_vpc.cidr_block, 8, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${data.aws_availability_zones.available.names[count.index]}"
  }
}
#Creating private subnets in all the avaialbility zones
resource "aws_subnet" "private" {
  count             = length(data.aws_availability_zones.available.names)
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.terraform_vpc.cidr_block, 8, count.index + length(data.aws_availability_zones.available.names))
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "private-${data.aws_availability_zones.available.names[count.index]}"
  }
}
