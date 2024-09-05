---

# IAM Configuration for EC2 and User Access

This document provides an overview of the AWS IAM configuration defined in the CloudFormation template. It includes the creation of a customer-managed policy, an IAM user with attached policies, and an IAM role for EC2 instances.

## Resources

### 1. Customer Managed Policy: `s3gudisa-managed-policy`

This IAM managed policy provides specific permissions for S3 access:

- **Policy Name**: `s3gudisa-managed-policy`
- **Description**: A policy for managing S3 access.
- **Policy Document**:
  ```json
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject"
        ],
        "Resource": [
          "arn:aws:s3:::your-bucket-name",
          "arn:aws:s3:::your-bucket-name/*"
        ]
      }
    ]
  }
  ```
  - **Actions Allowed**: List, get, and put objects in the specified S3 bucket.
  - **Resources**: Access to the bucket and its objects. Replace `your-bucket-name` with the actual S3 bucket name.

### 2. IAM User: `gudisa`

This IAM user is configured with several policies:

- **User Name**: `gudisa`
- **Managed Policies**:
  - `AdministratorAccess`: Grants full access to AWS services and resources.
  - `arn:aws:iam::014498664924:policy/s3gudisa`: A custom policy for additional access control.
  - `!Ref S3GudisaManagedPolicy`: The customer-managed policy defined above.
- **Inline Policy**:
  - **Policy Name**: `gudisa-inline-policy`
  - **Policy Document**:
    ```json
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "s3:*"
          ],
          "Resource": [
            "*"
          ]
        }
      ]
    }
    ```
    - **Actions Allowed**: Full S3 access.
    - **Resources**: All S3 resources.

### 3. IAM Role: `MyCustomEC2Role`

This IAM role is designed for EC2 instances to interact with S3:

- **Role Name**: `MyCustomEC2Role`
- **Assume Role Policy Document**:
  ```json
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  ```
  - **Principal**: EC2 instances.
  - **Action**: Allows EC2 instances to assume the role.
- **Description**: Allows EC2 instances to assume the role.
- **Managed Policies**:
  - `AmazonS3FullAccess`: Grants full access to S3 resources.
- **Max Session Duration**: `3600` seconds (1 hour).
- **Path**: `/`.
- **Permissions Boundary**: `arn:aws:iam::014498664924:policy/s3gudisa`: Limits permissions to those defined in this boundary policy.

## Summary

This configuration sets up:
- A customer-managed policy to control S3 bucket access.
- An IAM user with both managed and inline policies for comprehensive S3 access.
- An IAM role for EC2 instances, enabling them to assume the role and interact with S3 using the defined permissions.


---
