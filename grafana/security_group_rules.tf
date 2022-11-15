##
##
##

resource "aws_security_group_rule" "ingress_client_cidr_blocks" {
  count = length(var.ec2_client_cidr_blocks) > 0 ? 1 : 0

  description       = "Grafana clients"
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = var.ec2_client_cidr_blocks
}

resource "aws_security_group_rule" "egress_client_security_groups" {
  count = length(var.ec2_client_security_groups)

  description              = "Grafana"
  type                     = "egress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  security_group_id        = element(var.ec2_client_security_groups, count.index)
  source_security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_client_security_groups" {
  count = length(var.ec2_client_security_groups)

  description              = "Grafana client"
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  security_group_id        = module.ec2_service.ec2_security_group_id
  source_security_group_id = element(var.ec2_client_security_groups, count.index)
}
