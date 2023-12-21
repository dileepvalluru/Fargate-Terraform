resource "aws_codedeploy_app" "codedeploy_app" {
  compute_platform = "ECS"
  name             = "whiteboard"
}