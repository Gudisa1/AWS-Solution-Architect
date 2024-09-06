
# `access-bucket.sh`
This script is used to create an Amazon S3 bucket and configure its access settings. It performs the following actions:

1. **Creates an S3 Bucket**
2. **Sets Public Access Block Configuration**
3. **Sets Bucket Ownership Controls**
4. **Grants Read Access Using an ACL**

## Script Overview

The script performs the following operations:

### 1. Create an S3 Bucket

```bash
aws s3api create-bucket \
    --bucket gudisa-bucket \
    --region us-east-1
```

This command creates a new S3 bucket named `gudisa-bucket` in the `us-east-1` region.

### 2. Set Public Access Block Configuration

```bash
aws s3api put-public-access-block \
    --bucket gudisa-bucket \
    --public-access-block-configuration '{
        "BlockPublicAcls": false,
        "IgnorePublicAcls": false,
        "BlockPublicPolicy": true,
        "RestrictPublicBuckets": true
    }'
```

This command sets the public access block configuration for the bucket. It allows public access for ACLs and ignores public ACLs but restricts public policies and blocks public buckets.

### 3. Set Bucket Ownership Controls

```bash
aws s3api put-bucket-ownership-controls --bucket gudisa-bucket --ownership-controls '{
    "Rules": [
        {
            "ObjectOwnership": "BucketOwnerPreferred"
        }
    ]
}'
```

This command configures the bucket's ownership controls to prefer the bucket owner for object ownership.

### 4. Grant Read Access Using an ACL

```bash
aws s3api put-bucket-acl --bucket gudisa-bucket --grant-read 'id="CanonicalUserID"' --grant-read-acp 'id="CanonicalUserID"'
```

This command grants read access and read ACP permissions to the specified Canonical User ID. Replace `"CanonicalUserID"` with the actual Canonical User ID.

## Requirements

- AWS CLI installed and configured with appropriate permissions.
- The user running the script must have permissions to create S3 buckets and configure bucket settings.

## Usage

1. Save the script as `access-bucket.sh`.
2. Ensure the script has executable permissions:

    ```bash
    chmod +x access-bucket.sh
    ```

3. Run the script:

    ```bash
    ./access-bucket.sh
    ```

## Notes

- Make sure to replace `"CanonicalUserID"` with the appropriate Canonical User ID.
- The bucket name (`gudisa-bucket`) and region (`us-east-1`) can be adjusted as needed.

---

