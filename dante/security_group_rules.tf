##
##
##

resource "aws_security_group_rule" "ingress_client_cidr_blocks" {
  count = length(var.client_cidr_blocks) > 0 ? 1 : 0

  description       = "dante clients"
  type              = "ingress"
  from_port         = 53425
  to_port           = 53425
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = var.client_cidr_blocks
}

resource "aws_security_group_rule" "ingress_client_security_groups" {
  count = length(var.client_security_groups)

  description       = "dante client"
  type              = "ingress"
  from_port         = 53425
  to_port           = 53425
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  source_security_group_id = element(var.client_security_groups, count.index)
}

##
##
##

resource "aws_security_group_rule" "egress_dante" {
  description       = "Pass all traffic"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_client_security_groups" {
  count = length(var.client_security_groups)

  description       = "dante"
  type              = "egress"
  from_port         = 53425
  to_port           = 53425
  protocol          = "tcp"
  security_group_id = element(var.client_security_groups, count.index)
  source_security_group_id = module.ec2_service.ec2_security_group_id
}
