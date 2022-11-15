##
##
##

resource "aws_security_group_rule" "ingress_http" {
  count = length(var.client_cidr_blocks) > 0 ? 1 : 0

  description       = "HTTP"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = var.client_cidr_blocks
}

resource "aws_security_group_rule" "ingress_https" {
  count = length(var.client_cidr_blocks) > 0 ? 1 : 0

  description       = "HTTPS"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = var.client_cidr_blocks
}
