#Route Table for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_rt"
  }
}

#Public route table association with public subnets
resource "aws_route_table_association" "publicrt_association" {
  count          = length(aws_subnet.public.*.id)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# #Route tables for private subnets
# resource "aws_route_table" "private_route_table" {
#   count  = length(data.aws_availability_zones.available.names)
#   vpc_id = aws_vpc.terraform_vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
#   }

#   tags = {
#     Name = "PrivateRouteTable-${count.index}"
#   }
# }
# #Private route tables association
# resource "aws_route_table_association" "private_subnet_association" {
#   count          = length(aws_subnet.private.*.id)

#   subnet_id      = aws_subnet.private[count.index].id
#   route_table_id = aws_route_table.private_route_table[count.index].id
# }
