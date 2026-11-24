output "s3_bucket_name" {
  description = "Project 4 S3 bucket name"
  value       = aws_s3_bucket.project_bucket.id
}

output "iam_username" {
  description = "Created IAM username"
  value       = aws_iam_user.project_user.name
}

output "iam_user_arn" {
  description = "Created IAM user ARN"
  value       = aws_iam_user.project_user.arn
}

output "s3_policy_name" {
  description = "Attached IAM inline policy name"
  value       = aws_iam_user_policy.s3_read_policy.name
}

output "aws_region" {
  description = "AWS region"
  value       = var.aws_region
}
