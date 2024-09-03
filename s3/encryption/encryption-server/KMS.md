
---

# S3 Bucket Creation and File Upload with SSE-KMS Encryption

This Bash script automates the process of creating an Amazon S3 bucket and uploading a file with server-side encryption using AWS Key Management Service (KMS). The script simplifies the process of securing your data in S3 by ensuring that your files are encrypted with a specified KMS key during upload.

## Features

- **Bucket Creation:** Automatically creates an S3 bucket in the specified AWS region if it doesn't already exist.
- **File Upload with SSE-KMS Encryption:** Uploads a specified file to the S3 bucket, encrypting it using AWS KMS. You can specify a custom KMS key to encrypt your file.
- **Encryption Verification:** After the file is uploaded, the script verifies the encryption status to ensure that it has been encrypted using the specified KMS key.

## Prerequisites

- **AWS CLI:** Ensure that the AWS Command Line Interface (CLI) is installed and configured on your machine. You need to have the necessary IAM permissions to create S3 buckets and upload files with encryption.
- **KMS Key:** A KMS key ID or alias that you want to use for encrypting the file. The key must be in the same AWS account and region as the S3 bucket.

## Usage

To use this script, follow these steps:

1. **Set Up Your Environment:**
   - Make sure you have the AWS CLI installed and configured with the correct IAM permissions.
   - Ensure that you have a valid KMS key ID or alias available in the region where you want to create the bucket.

2. **Run the Script:**
   - Save the script to a file, for example, `kms.sh`.
   - Run the script with the following command:
     ```bash
     ./kms.sh <bucket-name> <file-to-upload>
     ```
   - Replace `<bucket-name>` with the name of the S3 bucket you want to create, and `<file-to-upload>` with the path to the file you want to upload.

3. **Example:**
   ```bash
   ./kms.sh my-bucket-name my-file.txt
   ```

4. **Check the Output:**
   - The script will create the S3 bucket, upload the file with SSE-KMS encryption, and confirm that the file is encrypted with the specified KMS key.

## Important Notes

- **Bucket Name Uniqueness:** S3 bucket names must be globally unique. If the specified bucket name already exists in another account, the bucket creation will fail.
- **KMS Key Permissions:** Ensure that the IAM role or user running the script has the necessary permissions to use the specified KMS key for encryption.

## Troubleshooting

- **Bucket Creation Errors:** If the bucket creation fails, check the AWS CLI error message for details. Common issues include permissions errors or conflicts with existing bucket names.
- **File Upload Errors:** If the file upload fails, ensure that the KMS key ID is correct and that you have permission to use it for encryption.

---
