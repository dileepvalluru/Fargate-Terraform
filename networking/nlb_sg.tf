resource "aws_security_group" "nlb_sg" {
  name        = "nlb-security-group"
  description = "Security group for Network Load Balancer"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description = "Allow inbound traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow inbound HTTPS traffic for WebSockets"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "NLB_Security_Group"
  }
}
