#Cretaing a security group for ecs tasks
resource "aws_security_group" "ecs_task_sg" {
  name        = "ecs-task-sg"
  description = "Security group for ECS Task which allows traffic only from the ELB"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.nlb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-task-security-group"
  }
}
