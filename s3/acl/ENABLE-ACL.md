
```markdown
# `enable-acl.sh`

## Description

The `enable-acl.sh` script automates the process of creating an Amazon S3 bucket, configuring public access settings, setting object ownership, and applying ACL (Access Control List) to grant full control to a specified IAM user.

## Usage

```bash
./enable-acl.sh <bucket-name>
```

### Parameters

- `<bucket-name>`: The name of the S3 bucket you want to create and configure.

## Script Breakdown

1. **Bucket Creation**:
   - Creates an S3 bucket with the specified name in the `us-east-1` region.

2. **Public Access Settings**:
   - Adjusts the public access block settings to allow public ACLs and policies:
     - `BlockPublicAcls`: false
     - `IgnorePublicAcls`: false
     - `BlockPublicPolicy`: false
     - `RestrictPublicBuckets`: false

3. **Object Ownership**:
   - Sets the object ownership to `BucketOwnerPreferred`, ensuring that the bucket owner will have control over all objects.

4. **ACL Configuration**:
   - Grants full control of the bucket to an IAM user specified by their ARN (`arn:aws:iam::ACCOUNT_ID:user/USERNAME`). 

## Notes

- Replace `ACCOUNT_ID` and `USERNAME` in the script with the actual AWS account ID and IAM username respectively.
- Ensure that you have the AWS CLI installed and configured with the necessary permissions to run this script.

## Error Handling

The script includes checks for each major operation to ensure that errors are caught and reported.

## Example

To run the script and create a bucket named `my-new-bucket`, you would use:

```bash
./enable-acl.sh my-new-bucket
```
```

