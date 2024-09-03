---

# SSE-C Encryption Script (`sse-c.sh`)

## Overview

The `sse-c.sh` script is a Bash utility designed to automate the process of uploading files to an Amazon S3 bucket with Server-Side Encryption using Customer-Provided Keys (SSE-C). This script allows you to specify a custom encryption key stored in a file, ensuring the security and confidentiality of your data during storage.

## Prerequisites

Before using the script, ensure that you have the following:

1. **AWS CLI**: The script requires the AWS Command Line Interface (CLI) to interact with S3. Ensure that the AWS CLI is installed and configured with appropriate credentials.

2. **Encryption Key File**: You need a file containing the encryption key to be used for SSE-C encryption. The key should be a valid AES-256 key.

## Usage

```bash
./sse-c.sh <bucket-name> <file-to-upload> <encryption-key-file>
```

- `<bucket-name>`: The name of the S3 bucket where the file will be uploaded.
- `<file-to-upload>`: The path to the file you want to upload to S3.
- `<encryption-key-file>`: The path to the file containing your encryption key.

## Features

- **Bucket Creation**: The script checks if the specified S3 bucket exists. If it doesn't, the bucket is created automatically.
- **SSE-C Encryption**: The file is uploaded to the S3 bucket using Server-Side Encryption with a Customer-Provided Key (SSE-C). The encryption key is securely encoded in Base64 format before transmission.
- **Error Handling**: The script includes error handling to ensure that the file is uploaded successfully. If the upload fails, an error message is displayed.

## Example

```bash
./sse-c.sh my-bucket /path/to/myfile.txt /path/to/encryption-key.txt
```

This command uploads `myfile.txt` to the S3 bucket `my-bucket` using the encryption key stored in `encryption-key.txt`.

## Notes

- Ensure that the encryption key file is stored securely and that it meets the requirements for AES-256 encryption.
- The script assumes that the S3 bucket is in the `us-east-1` region. Modify the script if you're using a different region.

## Contributing

Contributions to improve the script are welcome. Feel free to submit a pull request or suggest improvements.

---
