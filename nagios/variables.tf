variable "vpc_id" {
  description = "Deploy resources to this VPC."
  type        = string
}

variable "iam_policy_name" {
  description = "The name of the IAM policy."
  type        = string
  default     = "NagiosPolicy"
}

variable "service_role_name" {
  description = "The name of the EC2 instance role."
  type        = string
  default     = "Nagios"
}

variable "iam_role_name" {
  description = "The name of the IAM role."
  type        = string
  default     = "NagiosRole"
}

variable "aws_region" {
  description = "Which AWS region to use."
  type        = string
  default     = "us-east-1"
}

variable ec2_launch_template_name {
  description = "The name of the EC2 launch template."
  type        = string
  default     = "Nagios"
}

variable ec2_launch_template_description {
  description = "The launch template's description."
  type        = string
  default     =  "Nagios Server"
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
    "Name"       : "Nagios"
    "Managed-By" : "terraform"
  }
}

variable ec2_security_group_name {
  description = "The name of the EC2 security group."
  type        = string
  default     = "Nagios"
}

variable ec2_security_group_description {
  description = "The description of the EC2 security group."
  type        = string
  default     = "Nagios Server"
}

variable ec2_security_group_tags {
  description = "Tags for the EC2 security group."
  type        = map
  default     = {
    Managed-By : "terraform"
    Name       : "Nagios"
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

variable http_cidr_blocks {
  description = "A list of CIDR blocks for HTTP clients."
  type        = list
  default     = []
}

variable http_ipv6_cidr_blocks {
  description = "A list of IPv6 CIDR blocks for HTTP clients."
  type        = list
  default     = []
}

variable http_security_groups {
  description = "A list of security group ids for HTTP clients."
  type        = list
  default     = []
}

variable http_prefix_list_ids {
  description = "A list of prefix list ids for HTTP clients."
  type        = list
  default     = []
}

variable https_cidr_blocks {
  description = "A list of CIDR blocks for HTTPS clients."
  type        = list
  default     = []
}

variable https_ipv6_cidr_blocks {
  description = "A list of IPv6 CIDR blocks for HTTPS clients."
  type        = list
  default     = []
}

variable https_security_groups {
  description = "A list of security group ids for HTTPS clients."
  type        = list
  default     = []
}

variable https_prefix_list_ids {
  description = "A list of prefix list ids for HTTPS clients."
  type        = list
  default     = []
}
