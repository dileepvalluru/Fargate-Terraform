output "lb-arn" {
  value = aws_lb.nlb.arn
}
output "tg-arn" {
  value = aws_lb_target_group.tg-nlbs.arn
}