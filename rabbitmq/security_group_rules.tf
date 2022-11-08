resource "aws_security_group_rule" "ingress" {
  description       = "RabbitMQ"
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  security_group_id = module.ec2_service.ec2_security_group_id
}
