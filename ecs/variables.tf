variable "ecs_task_execution_role_arn" {
  type = string
}
variable "ecs_service_role_arn" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}
variable "ecs_tasks_sg" {
  type = string
}
variable "lb_arn" {
  type = string
}
variable "tg-arn" {
  type = string
}