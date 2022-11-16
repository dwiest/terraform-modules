##
##
##

resource "aws_security_group_rule" "ingress_client" {
  count = length(var.client_cidr_blocks) > 0 ? 1 : 0

  description       = "MariaDB client"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = var.client_cidr_blocks
}

##
##
##

resource "aws_security_group_rule" "egress_client_security_groups" {
  count = length(var.client_security_groups)

  description              = "MariaDB"
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.ec2_service.ec2_security_group_id
  prefix_list_ids   = var.client_prefix_list_ids
  security_group_id = element(var.client_security_groups, count.index)
}

##
##
##

resource "aws_security_group_rule" "ingress_client_security_groups" {
  count = length(var.client_security_groups)

  description              = "MariaDB client"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = element(var.client_security_groups, count.index)
  prefix_list_ids   = var.client_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}
