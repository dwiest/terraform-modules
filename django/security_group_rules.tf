##
##
##

resource "aws_security_group_rule" "egress_django_security_groups" {
  count = length(var.django_security_groups)

  description              = "django"
  type                     = "egress"
  from_port                = 8000
  to_port                  = 8000
  protocol                 = "tcp"
  source_security_group_id = module.ec2_service.ec2_security_group_id
  prefix_list_ids   = var.django_prefix_list_ids
  security_group_id = element(var.django_security_groups, count.index)
}

##
##
##

resource "aws_security_group_rule" "ingress_django_security_groups" {
  count = length(var.django_security_groups)

  description              = "django client"
  type                     = "ingress"
  from_port                = 8000
  to_port                  = 8000
  protocol                 = "tcp"
  source_security_group_id = element(var.django_security_groups, count.index)
  prefix_list_ids   = var.django_prefix_list_ids
  security_group_id = module.ec2_service.ec2_security_group_id
}
