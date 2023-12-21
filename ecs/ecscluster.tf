#Creating an ECS cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "whiteboard"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

#Creating ECS service
resource "aws_ecs_service" "service" {
  name            = "whiteboard"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.id
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.public_subnet_ids
    security_groups = [var.ecs_tasks_sg]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.tg-arn
    container_name   = "whiteboard"
    container_port   = 3000
  }

  desired_count = 2
}
