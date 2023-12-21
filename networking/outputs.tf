output "available_azs" {
  value = data.aws_availability_zones.available.names
}

output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "NLB_Security_Group_id" {
  value = aws_security_group.nlb_sg.id
}

output "ecs_tasks_sg" {
  value = aws_security_group.ecs_task_sg.id
}


