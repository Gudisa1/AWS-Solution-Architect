
---

# sse-s3-encryption.sh

## Overview

`sse-s3-encryption.sh` is a Bash script that automates the process of creating an Amazon S3 bucket and securely uploading a file to it using server-side encryption (SSE). The script leverages AWS's default encryption method (AES-256) to ensure that the data stored in the S3 bucket is encrypted at rest, providing an additional layer of security for your files.

## Features

- **Bucket Creation:** The script checks if the specified bucket already exists in the `us-east-1` region. If it doesn't exist, it will create a new bucket with the provided name.
- **File Upload:** Once the bucket is successfully created, the script uploads the specified file to the S3 bucket. By default, the file will be encrypted using server-side encryption (AES-256).
- **Encryption Validation:** After the file is uploaded, the script verifies the encryption status of the uploaded object to confirm that it has been encrypted with AES-256.

## Usage

### Prerequisites

- Ensure that the AWS CLI is installed and configured with appropriate credentials.
- The script requires two arguments: the bucket name and the file you want to upload.

### How to Use

1. Make the script executable:
   ```bash
   chmod +x sse-s3-encryption.sh
   ```

2. Run the script with the required arguments:
   ```bash
   ./sse-s3-encryption.sh <bucket-name> <file-to-upload>
   ```

   Example:
   ```bash
   ./sse-s3-encryption.sh my-secure-bucket my-file.txt
   ```

3. The script will create the S3 bucket (if it doesn't already exist) and upload the specified file with server-side encryption.

## Script Explanation

- **Bucket Creation:** The script uses the `aws s3api create-bucket` command to create an S3 bucket in the `us-east-1` region.
- **File Upload:** The script uses the `aws s3 cp` command to upload the file to the S3 bucket. By default, AWS S3 applies AES-256 encryption to all files stored in the bucket.
- **Encryption Validation:** The script checks the encryption status of the uploaded file using the `aws s3api head-object` command and verifies that the file is encrypted with AES-256.

## Error Handling

- The script checks for missing arguments and will exit with an error message if the bucket name or file is not provided.
- If the bucket creation or file upload fails, the script will exit with an appropriate error message.

## License

This script is provided as-is, without any warranties. Feel free to modify and use it according to your needs.

---

