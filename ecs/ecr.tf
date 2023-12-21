#Creating the repositoryto store docker images
resource "aws_ecr_repository" "repository" {
  name                 = "whiteboard"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}