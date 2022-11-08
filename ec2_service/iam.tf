##
## Create an IAM role for the service instance to use.
##

resource "aws_iam_role" "service" {
  name = var.iam_role_name

#  assume_role_policy = "${var.iam_assume_role_policy}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Sid    = "",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

#  inline_policy {
#    name   = "HAProxyS3Access"
#    policy = jsonencode({
#      Version   = "2012-10-17"
#      Statement = [
#        {
#          Action   = [
#            "s3:ListBucket",
#          ]
#          Effect   = "Allow"
#          Resource = "arn:aws:s3:::dwiest-backups"
#          Sid      = "VisualEditor0"
#        },
#        {
#          Action   = "s3:*"
#          Effect   = "Allow"
#          Resource = "arn:aws:s3:::dwiest-backups/ec2/service/*"
#          Sid      = "VisualEditor1"
#        },
#       ]
#    })
#  }

  tags = {}
}

##
## Create an IAM role policy to grant the necessary permissions to the role.
##

#resource "aws_iam_role_policy" "service" {
#  name = var.service_policy_name
#  role = aws_iam_role.service.id
#
#  policy = ""
#}

resource "aws_iam_instance_profile" "service" {
  name = var.service_role_name
  role = aws_iam_role.service.name
  tags = {}
}
