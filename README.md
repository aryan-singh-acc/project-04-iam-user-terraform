
# Project 4 – IAM User Automation with Terraform

## Project Overview

This project demonstrates automated IAM user creation using Terraform with controlled S3 read-only permissions.

A dedicated S3 bucket is created for testing. An IAM user is created and assigned an inline policy that permits reading objects from this bucket.

## Technologies Used

- AWS IAM
- Amazon S3
- Terraform
- AWS CLI

## AWS Configuration

| Component | Configuration |
|---|---|
| Region | us-east-2 |
| IAM User | Aryan-Project-04-User |
| S3 Bucket | aryan-w-singh-project-04-iam-2026-<generated-suffix> |
| Permission | S3 Read-Only |
| Policy Type | IAM Inline Policy |
| Public Access | Blocked |

## IAM Permissions

Allowed:
- s3:ListBucket
- s3:GetBucketLocation
- s3:GetObject

Not granted:
- s3:PutObject
- s3:DeleteObject

## Terraform Implementation

The S3 permission actions are stored in the `s3_read_policy` Terraform variable.

Terraform uses this variable to generate the IAM policy using `jsonencode()`.

## Deployment

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Verification

```bash
terraform output
terraform state list
```

IAM policy inspection:

```bash
aws iam get-user-policy \
  --user-name Aryan-Project-04-User \
  --policy-name AryanProject04S3ReadOnly
```

## Cleanup

Review the resources before removal:

```bash
terraform plan -destroy
```

Destroy the resources managed by this project:

```bash
terraform destroy
```

## Author

Aryan Singh
