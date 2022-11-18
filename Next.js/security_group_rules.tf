##
##
##

resource "aws_security_group_rule" "ingress_3000" {
  description              = "Next.js client"
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  security_group_id = module.ec2_service.ec2_security_group_id
  cidr_blocks = ["0.0.0.0/0"]
}
