variable "vpc_id" {
  description = "Deploy resources to this VPC."
  type        = string
}

variable "iam_policy_name" {
  description = "The name of the IAM policy."
  type        = string
  default     = "EC2Service"
}

variable "iam_role_name" {
  description = "The name of the IAM role."
  type        = string
  default     = "EC2ServiceRole"
}

variable "service_role_name" {
  description = "The name of the IAM service role."
  type        = string
  default     = "EC2ServiceRole"
}

variable ec2_launch_template_name {
  description = "The name of the EC2 launch template."
  type        = string
  default     = "EC2Service"
}

variable ec2_launch_template_description {
  description = "The launch template's description."
  type        = string
  default     =  "EC2Service"
}

variable ec2_root_ebs_volume_size {
  description = "Size of the root EBS volume in GB."
  type        = number
  default     = 8
}

variable ec2_ebs_optimized {
  description = "Is the EC2 instance EBS optimized?"
  type        = bool
  default     = false
}

variable ec2_image_id {
  description = "The AMI image id to use."
  type        = string
}

variable ec2_instance_type {
  description = "The EC2 instance type."
  type        = string
}

variable ec2_ssh_key_name {
  description = "The SSH private key to use for the ec2-user account."
  type        = string
  default     = ""
}

variable ec2_instance_tags {
  description = "Tags to apply to EC2 instances launched using this template."
  type        = map

  default = {
    "Name"       : "EC2Service"
    "Managed-By" : "terraform"
  }
}

variable ec2_security_group_name {
  description = "EC2 security group name."
  type        = string
}

variable ec2_security_group_description {
  description = "EC2 security group description."
  type        = string
}

variable ec2_security_group_tags {
  description = "Tags to apply to the security group."
  type        = map

  default = {
    "Managed-By" : "terraform"
  }
}

variable ec2_security_groups {
  description = "Additional security groups for the EC2 instances."
  type        = list
  default     = []
}

variable ec2_subnet {
  description = "Launch EC2 instances in this subnet."
  type        = string
  default     = ""
}

variable ec2_assign_public_ip {
  description = "Auto-assign a public IP address to the EC2 instances?"
  type        = bool
  default     = false
}

variable iam_assume_role_policy {
  description = ""
  type = string
  default = ""
}
