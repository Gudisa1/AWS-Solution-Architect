````markdown
# AWS S3 Bucket Policy Management

This repository contains scripts and configurations for managing AWS S3 bucket policies and access permissions.

## Overview

This project provides a sample S3 bucket policy JSON and AWS CLI commands for creating and managing S3 bucket policies. The provided policy allows specific AWS accounts to list and read objects in the bucket. This can be useful for sharing access between different AWS accounts.

## Bucket Policy JSON

The `bucket-policy.json` file defines the permissions for the S3 bucket. Below is a description of the JSON structure:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456DFDSF789012:root" // Replace with the target AWS account ID
      },
      "Action": ["s3:ListBucket"],
      "Resource": "arn:aws:s3:::your-bucket-name" // Replace with your bucket name
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::1234534636436789012:root" // Replace with the target AWS account ID
      },
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::your-bucket-name/*" // Replace with your bucket name and object path
    }
  ]
}
```
````

### Description

- **Effect**: Specifies whether the policy allows or denies access.
- **Principal**: Defines the AWS accounts or users that are granted permissions.
- **Action**: Lists the actions permitted by the policy (e.g., `s3:ListBucket`, `s3:GetObject`).
- **Resource**: Identifies the S3 bucket and objects to which the policy applies.

## AWS CLI Commands

### Create S3 Bucket

To create an S3 bucket, use the following command:

```bash
aws s3api create-bucket \
    --bucket gudisa-bucket \
    --region us-east-1
```

### Apply Bucket Policy

To apply the policy from `bucket-policy.json` to the bucket, use the following command:

```bash
aws s3api put-bucket-policy --bucket gudisa-bucket --policy file:///path/to/bucket-policy.json
```

Replace `/path/to/bucket-policy.json` with the actual path to your policy JSON file.

## Notes

- Ensure that the bucket name and AWS account IDs in the policy file are correctly replaced with your specific details.
- The bucket policy file should be accessible from the path provided in the CLI command.
- Review the permissions carefully to avoid unintended access.

## Contributing

Feel free to submit issues or pull requests if you find any bugs or improvements.
