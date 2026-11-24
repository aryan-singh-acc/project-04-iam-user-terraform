
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Create a private S3 bucket
resource "aws_s3_bucket" "project_bucket" {
  bucket_prefix = "aryan-w-singh-project-04-iam-2026-"

  tags = {
    Name      = "Aryan Singh Project 4 IAM Bucket"
    Owner     = "Aryan Singh"
    Project   = "Capstone Project 4"
    ManagedBy = "Terraform"
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "project_bucket" {
  bucket = aws_s3_bucket.project_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# Create IAM user
resource "aws_iam_user" "project_user" {
  name = var.iam_username

  tags = {
    Name      = "Aryan Project 4 IAM User"
    Owner     = "Aryan Singh"
    Project   = "Capstone Project 4"
    ManagedBy = "Terraform"
  }
}

# Attach S3 read-only inline policy
resource "aws_iam_user_policy" "s3_read_policy" {
  name = "AryanProject04S3ReadOnly"
  user = aws_iam_user.project_user.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = var.s3_read_policy.bucket_actions

        Resource = aws_s3_bucket.project_bucket.arn
      },
      {
        Effect = "Allow"

        Action = var.s3_read_policy.object_actions

        Resource = "${aws_s3_bucket.project_bucket.arn}/*"
      }
    ]
  })
}
