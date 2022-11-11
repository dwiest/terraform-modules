resource "aws_security_group" "client" {
  name        = var.client_security_group_name
  description = var.client_security_group_description
  vpc_id      = var.vpc_id

  tags = var.client_security_group_tags
}
