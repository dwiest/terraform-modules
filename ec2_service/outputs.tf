output iam_role_id {
  value = aws_iam_role.service.id
}

output iam_instance_profile_id {
  value = aws_iam_instance_profile.service.id
}

output ec2_launch_template_id {
  value = aws_launch_template.service.id
}

output ec2_security_group_id {
  value = aws_security_group.service.id
}
