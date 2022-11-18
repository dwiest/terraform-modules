resource "aws_iam_policy" "policy" {
    name   = "S3Access"
    policy = jsonencode({
      Version   = "2012-10-17"
      Statement = [
        {
          Action   = [
            "s3:ListBucket",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:s3:::dwiest-backups"
          Sid      = "VisualEditor0"
        },
        {
          Action   = "s3:Get*"
          Effect   = "Allow"
          Resource = "arn:aws:s3:::dwiest-backups/ec2/btc-core/*"
          Sid      = "VisualEditor1"
        },
       ]
    })
  }

resource "aws_iam_role_policy_attachment" "policy" {
  role       = module.ec2_service.iam_role_id
  policy_arn = aws_iam_policy.policy.arn
}
