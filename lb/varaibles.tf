variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
variable "nlb_sg_id" {
  type = string
}