##
##
##

resource "aws_security_group_rule" "ingress_client_cidr_blocks" {
  count = length(var.ec2_client_cidr_blocks) > 0 ? 1 : 0

  description       = "Prometheus clients"
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = var.ec2_client_cidr_blocks
}

resource "aws_security_group_rule" "egress_client_security_groups" {
  count = length(var.ec2_client_security_groups)

  description              = "Prometheus"
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  security_group_id        = element(var.ec2_client_security_groups, count.index)
  source_security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_client_security_groups" {
  count = length(var.ec2_client_security_groups)

  description              = "Prometheus client"
  type                     = "ingress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  security_group_id        = module.ec2_service.ec2_security_group_id
  source_security_group_id = element(var.ec2_client_security_groups, count.index)
}
