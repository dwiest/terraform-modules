##
##
##

resource "aws_security_group_rule" "ingress_tor" {
  description       = "Tor"
  type              = "ingress"
  from_port         = 9001
  to_port           = 9001
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

##
##
##

resource "aws_security_group_rule" "egress_tor_8080" {
  description       = "Tor"
  type              = "egress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_tor_8888" {
  description       = "Tor"
  type              = "egress"
  from_port         = 8888
  to_port           = 8888
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "egress_tor_9001" {
  description       = "Tor"
  type              = "egress"
  from_port         = 9001
  to_port           = 9001
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_9002" {
  description       = "Tor"
  type              = "egress"
  from_port         = 9002
  to_port           = 9002
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_9004" {
  description       = "Tor"
  type              = "egress"
  from_port         = 9004
  to_port           = 9004
  protocol          = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}
