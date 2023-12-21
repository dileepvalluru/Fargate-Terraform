#Creating a role for ecs task execution and attaching polocies to the role
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecstaskexecutionrole11"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
      },
    ],
  })
}
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

#Creating an AWS ECS Service role
resource "aws_iam_role" "ecs_service_role" {
  name = "ecs_service_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs.amazonaws.com"
        },
      },
    ],
  })
}

# resource "aws_iam_role_policy_attachment" "ecs_service_role_attachment" {
#   role       = aws_iam_role.ecs_service_role.name
#   policy_arn = "arn:aws:iam::aws:policy/aws-service-role/arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
# }

