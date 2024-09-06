````markdown
# `host-static-website.sh`

## Overview

The `host-static-website.sh` script sets up an Amazon S3 bucket for hosting a static website. It creates a new S3 bucket, adjusts its public access settings to allow public access, and applies a bucket policy to make the objects publicly readable.

## Prerequisites

- AWS CLI installed and configured with the appropriate credentials and permissions.
- The bucket name you choose must be unique globally.

## Usage

Run the script by providing a bucket name as an argument:

```bash
./host-static-website.sh <bucket-name>
```
````

### Arguments

- `<bucket-name>`: The name for the S3 bucket to be created. Ensure this name is globally unique.

## Script Details

### 1. Create the S3 Bucket

The script uses the AWS CLI command `aws s3api create-bucket` to create a new S3 bucket in the `us-east-1` region.

```bash
aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION
```

- **Success Message**: "Bucket $BUCKET_NAME created successfully."
- **Error Message**: "Error: Failed to create bucket $BUCKET_NAME."

### 2. Adjust Public Access Settings

The script configures the bucket’s public access block settings to allow public access through bucket policies.

```bash
aws s3api put-public-access-block --bucket $BUCKET_NAME --public-access-block-configuration '{
    "BlockPublicAcls": false,
    "IgnorePublicAcls": false,
    "BlockPublicPolicy": false,
    "RestrictPublicBuckets": false
}'
```

- **Success Message**: "Public access settings adjusted for bucket $BUCKET_NAME."
- **Error Message**: "Error: Failed to adjust public access settings for $BUCKET_NAME."

### 3. Set a Bucket Policy for Public Read Access

The script sets a bucket policy to allow public read access to all objects in the bucket.

```bash
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::'"$BUCKET_NAME"'/*"
        }
    ]
}'
```

- **Success Message**: "Bucket policy set successfully for bucket $BUCKET_NAME."
- **Error Message**: "Error: Failed to set bucket policy for $BUCKET_NAME."

## Example

To create a bucket named `example-static-website` and configure it for static website hosting, run:

```bash
./host-static-website.sh example-static-website
```

## Troubleshooting

- **Bucket Name Conflicts**: If the bucket name is already taken, choose a different, unique name.
- **Permissions**: Ensure your AWS CLI user has sufficient permissions to create buckets and set policies.

```

```
