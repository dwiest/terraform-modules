##
##
##

resource "aws_security_group_rule" "ingress_btc" {
  description       = "btc-core"
  type              = "ingress"
  from_port         = 8333
  to_port           = 8333
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

##
##
##

resource "aws_security_group_rule" "egress_btc" {
  description       = "btc-core"
  type              = "egress"
  from_port         = 8333
  to_port           = 8333
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}
