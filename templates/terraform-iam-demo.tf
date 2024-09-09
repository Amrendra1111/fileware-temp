# NOTICE: This is a demo file for you to get started.
# Make sure to edit and rename the file. If not renamed, the file will not be saved!

# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Specify your region
}

# IAM Role
resource "aws_iam_role" "example_role" {
  name               = "example_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "example_policy" {
  name   = "example_policy"
  role   = aws_iam_role.example_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::example_bucket",
        "arn:aws:s3:::example_bucket/*"
      ]
    }
  ]
}
EOF
}
