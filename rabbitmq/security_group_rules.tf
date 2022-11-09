##
##
##

resource "aws_security_group_rule" "egress_apmd" {
  description       = "APMD"
  type              = "egress"
  from_port         = 4369
  to_port           = 4369
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  self              = true
}

resource "aws_security_group_rule" "ingress_apmd" {
  description       = "APMD"
  type              = "ingress"
  from_port         = 4369
  to_port           = 4369
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  self              = true
}

##
##
##

resource "aws_security_group_rule" "egress_internode" {
  description       = "inter-node"
  type              = "egress"
  from_port         = 25672
  to_port           = 25672
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  self              = true
}

resource "aws_security_group_rule" "ingress_internode" {
  description       = "inter-node"
  type              = "ingress"
  from_port         = 25672
  to_port           = 25672
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  self              = true
}

##
##
##

resource "aws_security_group_rule" "ingress_amqps_cidr_blocks" {
  count = length(var.amqps_cidr_blocks) + length(var.amqps_ipv6_cidr_blocks) > 0 ? 1 : 0
  description       = "AMQPS client"
  type              = "ingress"
  from_port         = 5671
  to_port           = 5671
  protocol          = "tcp"
  cidr_blocks       = var.amqps_cidr_blocks
  ipv6_cidr_blocks  = var.amqps_ipv6_cidr_blocks
  prefix_list_ids   = var.amqps_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_amqps_security_groups" {
  count = length(var.amqps_security_groups)
  description       = "AMQPS client"
  type              = "ingress"
  from_port         = 5671
  to_port           = 5671
  protocol          = "tcp"
  source_security_group_id = element(var.amqps_security_groups, count.index)
  prefix_list_ids   = var.amqps_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

##
##
##

resource "aws_security_group_rule" "ingress_amqp_cidr_blocks" {
  count = length(var.amqp_cidr_blocks) + length(var.amqp_ipv6_cidr_blocks) > 0 ? 1 : 0
  description       = "AMQP client"
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  cidr_blocks       = var.amqp_cidr_blocks
  ipv6_cidr_blocks  = var.amqp_ipv6_cidr_blocks
  prefix_list_ids   = var.amqp_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_amqp_security_groups" {
  count = length(var.amqp_security_groups)
  description       = "AMQP client"
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id = element(var.amqp_security_groups, count.index)
  prefix_list_ids   = var.amqp_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

##
##
##

resource "aws_security_group_rule" "ingress_mgmt_cidr_blocks" {
  count = length(var.mgmt_cidr_blocks) + length(var.mgmt_ipv6_cidr_blocks) > 0 ? 1 : 0
  description       = "RabbitMQ management interface client"
  type              = "ingress"
  from_port         = 15672
  to_port           = 15672
  protocol          = "tcp"
  cidr_blocks       = var.mgmt_cidr_blocks
  ipv6_cidr_blocks  = var.mgmt_ipv6_cidr_blocks
  prefix_list_ids   = var.mgmt_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_mgmt_security_groups" {
  count = length(var.mgmt_security_groups)
  description       = "RabbitMQ management interface client"
  type              = "ingress"
  from_port         = 15672
  to_port           = 15672
  protocol          = "tcp"
  source_security_group_id = element(var.mgmt_security_groups, count.index)
  prefix_list_ids   = var.mgmt_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "egress_mgmt_security_groups" {
  count = length(var.mgmt_security_groups)
  description       = "RabbitMQ management interface client"
  type              = "egress"
  from_port         = 15672
  to_port           = 15672
  protocol          = "tcp"
  source_security_group_id = module.ec2_service.ec2_security_group_id
  prefix_list_ids   = var.mgmt_prefix_list_ids
  security_group_id = element(var.mgmt_security_groups, count.index)
}
