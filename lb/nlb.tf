data "aws_vpc" "terraform_vpc" {
  tags = {
    Name = "terraform_vpc"
  }
}

#Creating a network load balancer and a target group
resource "aws_lb" "nlb" {
  name               = "nlb"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [var.nlb_sg_id]
  subnets            = var.public_subnet_ids
}

resource "aws_lb_target_group" "tg-nlbs" {
  name        = "tg-nlb"
  port        = 80
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.terraform_vpc.id
}

#Attching load balancer with the target group
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-nlbs.arn
  }
}
