resource "aws_launch_template" "service" {
  name = var.ec2_launch_template_name

  description = var.ec2_launch_template_description

  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.ec2_root_ebs_volume_size
      delete_on_termination = true
      encrypted = true
    }
  }

  ebs_optimized = var.ec2_ebs_optimized

  iam_instance_profile {
    name = aws_iam_instance_profile.service.name
  }

  image_id = var.ec2_image_id

  instance_initiated_shutdown_behavior = "terminate"

 # instance_market_options {
 #   market_type = "spot"
 # }

  instance_type = var.ec2_instance_type

  key_name = var.ec2_ssh_key_name

  monitoring {
    enabled = false
  }

  network_interfaces {
    associate_public_ip_address = var.ec2_assign_public_ip
    security_groups = concat(var.ec2_security_groups,[aws_security_group.service.id])
    delete_on_termination = true
    subnet_id = var.ec2_subnet
  }

# pick one of following
#  security_group_names = []
#  vpc_security_group_ids = []

  tag_specifications {
    resource_type = "instance"
    tags = var.ec2_instance_tags
  }

  user_data = filebase64("${path.module}/user_data.txt")
}
