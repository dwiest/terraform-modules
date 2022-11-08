resource "aws_security_group" "service" {
  name        = var.ec2_security_group_name
  description = var.ec2_security_group_description
  vpc_id      = var.vpc_id

  tags = var.ec2_security_group_tags
}
