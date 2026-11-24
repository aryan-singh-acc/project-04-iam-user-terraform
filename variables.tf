variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "us-east-2"
}

variable "iam_username" {
  description = "Name of the IAM user"
  type        = string
  default     = "Aryan-Project-04-User"
}

variable "s3_read_policy" {
  description = "S3 read-only permissions for the project bucket"

  type = object({
    bucket_actions = list(string)
    object_actions = list(string)
  })

  default = {
    bucket_actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]

    object_actions = [
      "s3:GetObject"
    ]
  }
}
