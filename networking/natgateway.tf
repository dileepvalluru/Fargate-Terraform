# #Creating an EIP and a NAT gateway for private subnets
# resource "aws_eip" "nat_eip" {
#   count = length(data.aws_availability_zones.available.names)
#   tags = {
#     Name = "NatEIP-${count.index}"
#   }
# }
# resource "aws_nat_gateway" "nat_gateway" {
#   count         = length(data.aws_availability_zones.available.names)
#   allocation_id = aws_eip.nat_eip[count.index].id
#   subnet_id     = aws_subnet.public[count.index].id

#   tags = {
#     Name = "MyNATGateway-${count.index}"
#   }
# }



