````markdown
# S3 Bucket Management Scripts

This repository contains two Bash scripts for managing Amazon S3 buckets using the AWS CLI. These scripts help in creating S3 buckets, configuring public access settings, setting bucket policies, and managing object ownership.

## Scripts

### 1. `enable-acl.sh`

This script creates an S3 bucket and configures it to allow ACLs by adjusting public access settings and setting object ownership to `BucketOwnerPreferred`.

#### Usage

```bash
./enable-acl.sh <bucket-name>
```
````

#### Example

```bash
./enable-acl.sh my-new-bucket
```

#### Description

- **Creates an S3 bucket** with the specified name in the `us-east-1` region.
- **Disables Block Public Access settings** to allow ACLs.
- **Sets object ownership** to `BucketOwnerPreferred`, ensuring that the bucket owner has control over all objects.
- **Prints status messages** about the success or failure of each operation.

#### Prerequisites

- AWS CLI installed and configured with appropriate credentials.
- Sufficient IAM permissions to create buckets and modify access settings.

### 2. `host-static-website.sh`

This script creates an S3 bucket, configures it to allow public access through a bucket policy, and sets the appropriate public access settings to host a static website.

#### Usage

```bash
./host-static-website.sh <bucket-name>
```

#### Example

```bash
./host-static-website.sh my-public-bucket
```

#### Description

- **Creates an S3 bucket** with the specified name in the `us-east-1` region.
- **Disables Block Public Access settings** to allow public access via bucket policy.
- **Sets a bucket policy** to allow public read access for all objects in the bucket.
- **Prints status messages** about the success or failure of each operation.

#### Prerequisites

- AWS CLI installed and configured with appropriate credentials.
- Sufficient IAM permissions to create buckets and set bucket policies.

## Notes

- Make sure to replace `<bucket-name>` with the desired name for your S3 bucket.
- The `us-east-1` region is used by default. Modify the `REGION` variable in the script if you need to use a different AWS region.
- Be cautious when setting public access for buckets as it can expose your data to the public.

This README provides an overview of each script, including usage instructions and prerequisites, ensuring users can effectively manage their S3 buckets.
