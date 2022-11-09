output iam_role_id {
  value = module.ec2_service.iam_role_id
}

output iam_instance_profile_id {
  value = module.ec2_service.iam_instance_profile_id
}

output ec2_launch_template_id {
  value = module.ec2_service.ec2_launch_template_id
}

output ec2_security_group_id {
  value = module.ec2_service.ec2_security_group_id
}
