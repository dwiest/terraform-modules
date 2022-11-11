##
##
##

resource "aws_security_group_rule" "egress_nrpe" {
  description       = "NRPE"
  type              = "egress"
  from_port         = 5666
  to_port           = 5666
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  self              = true
}

##
##
##

resource "aws_security_group_rule" "ingress_http_cidr_blocks" {
  count = length(var.http_cidr_blocks) + length(var.http_ipv6_cidr_blocks) > 0 ? 1 : 0

  description       = "HTTP client"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.http_cidr_blocks
  ipv6_cidr_blocks  = var.http_ipv6_cidr_blocks
  prefix_list_ids   = var.http_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_http_security_groups" {
  count = length(var.http_security_groups)

  description              = "HTTP client"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = element(var.http_security_groups, count.index)
  prefix_list_ids   = var.http_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

##
##
##

resource "aws_security_group_rule" "ingress_https_cidr_blocks" {
  count = length(var.https_cidr_blocks) + length(var.https_ipv6_cidr_blocks) > 0 ? 1 : 0

  description       = "HTTPS client"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.https_cidr_blocks
  ipv6_cidr_blocks  = var.https_ipv6_cidr_blocks
  prefix_list_ids   = var.https_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

resource "aws_security_group_rule" "ingress_https_security_groups" {
  count = length(var.https_security_groups)

  description              = "HTTPS client"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = element(var.https_security_groups, count.index)
  prefix_list_ids   = var.https_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}

##
##
##

resource "aws_security_group_rule" "egress_icmp" {
  description      = "Allow ICMP out to clients"
  type             = "egress"
  from_port        = -1
  to_port          = -1
  protocol         = "icmp"
  security_group_id = module.ec2_service.ec2_security_group_id
  source_security_group_id = aws_security_group.client.id
}

resource "aws_security_group_rule" "ingress_icmp" {
  description      = "Allow ICMP in from Nagios server"
  type             = "ingress"
  from_port        = -1
  to_port          = -1
  protocol         = "icmp"
  security_group_id = aws_security_group.client.id
  source_security_group_id = module.ec2_service.ec2_security_group_id
}
