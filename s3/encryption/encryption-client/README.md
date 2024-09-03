---

# Client-Side Encryption with AWS S3 Upload Script

This script allows you to encrypt a file using Client-Side Encryption (CSE) with OpenSSL and upload the encrypted file to an AWS S3 bucket. The script takes a bucket name, file to upload, and encryption key as arguments, then handles the encryption and upload process.

## Features

- **Client-Side Encryption (CSE):** The script uses AES-256-CBC encryption with OpenSSL, ensuring your data is encrypted before being uploaded to S3.
- **S3 Bucket Creation:** If the specified S3 bucket does not exist, the script will create it.
- **Secure Upload:** The encrypted file is uploaded to the specified S3 bucket, ensuring your data remains protected.

## Prerequisites

Before using this script, ensure you have the following:

- **AWS CLI:** The AWS CLI must be installed and configured with the necessary permissions to create buckets and upload files to S3.
- **OpenSSL:** The script uses OpenSSL to perform file encryption.
- **Bash:** This script is intended to be run in a Unix-like environment with Bash.

## Usage

```bash
./client.sh <bucket-name> <file-to-upload> <encryption-key>
```

### Parameters

- `<bucket-name>`: The name of the S3 bucket where the encrypted file will be uploaded.
- `<file-to-upload>`: The path to the file you want to encrypt and upload.
- `<encryption-key>`: A secret key used for encrypting the file. This key should be kept secure.

### Example

```bash
./client.sh my-secure-bucket myfile.txt mysecretkey123
```

This command will:

1. Check if the S3 bucket `my-secure-bucket` exists. If not, it will create the bucket.
2. Encrypt `myfile.txt` using the provided encryption key `mysecretkey123`.
3. Upload the encrypted file `myfile.txt.enc` to the S3 bucket `my-secure-bucket`.
4. Clean up by removing the encrypted file from the local filesystem.

### Notes

- The script uses AES-256-CBC with PBKDF2 to enhance the security of the encryption process.
- Make sure your encryption key is strong and kept private.



---
