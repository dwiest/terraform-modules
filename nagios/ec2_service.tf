module "ec2_service" {
  source = "../ec2_service"

  iam_role_name     = var.iam_role_name
  service_role_name = var.service_role_name

  ec2_image_id                    = var.ec2_image_id
  ec2_launch_template_name        = var.ec2_launch_template_name
  ec2_launch_template_description = var.ec2_launch_template_description
  ec2_instance_type               = var.ec2_instance_type
  ec2_instance_tags               = var.ec2_instance_tags
  ec2_security_group_name         = var.ec2_security_group_name
  ec2_security_group_description  = var.ec2_security_group_description
  ec2_security_group_tags         = var.ec2_security_group_tags
  ec2_security_groups             = var.ec2_security_groups
  ec2_assign_public_ip            = var.ec2_assign_public_ip
  ec2_ssh_key_name                = var.ec2_ssh_key_name

  vpc_id = var.vpc_id
}
