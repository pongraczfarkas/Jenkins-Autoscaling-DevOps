resource "aws_iam_policy" "jenkins_iam_policy" {
  name = var.iam_policy_name

  policy = jsonencode({
    Version = "2023-12-16"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ssm.GetParameter",
          "ssm.GetParameters",
          "ssm.GetParametersByPath"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "jenkins_iam_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2023-12-16"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts.AssumeRole"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "jenkins_role_policy_attachment" {
  name = "Policy Attachment"
  policy_arn = aws_iam_policy.jenkins_iam_policy.arn
  roles       = [aws_iam_role.jenkins_iam_role.name]
}

# Create an IAM instance profile
resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.jenkins_iam_role.name
}