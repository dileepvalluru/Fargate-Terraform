#Creating task definition
data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecstaskexecutionrole11"
}
resource "aws_ecs_task_definition" "task_definition" {
  family                   = "whiteboard"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  cpu                      = 512
  memory                   = 1024
  container_definitions = jsonencode([{
    name  = "whiteboard"
    image = "137354898470.dkr.ecr.eu-west-1.amazonaws.com/whiteboard:latest"
    portMappings = [
      {
        containerPort = 3000
        hostPort      = 3000
      },
    ]
  }])
}