#!/bin/bash

# Check if a bucket name, file, and encryption key were provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Error: No bucket name, file, or encryption key provided."
    echo "Usage: $0 <bucket-name> <file-to-upload> <encryption-key>"
    exit 1
fi

# Variables
BUCKET_NAME="$1"
FILE_TO_UPLOAD="$2"
ENCRYPTION_KEY="$3"
REGION="us-east-1"

# Create the S3 bucket if it does not exist
aws s3api head-bucket --bucket "$BUCKET_NAME" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION"
    if [ $? -eq 0 ]; then
        echo "Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
    else
        echo "Error: Failed to create bucket '$BUCKET_NAME'."
        exit 1
    fi
else
    echo "Bucket '$BUCKET_NAME' already exists."
fi

# Encrypt the file using OpenSSL and AES-256-CBC
ENCRYPTED_FILE="${FILE_TO_UPLOAD}.enc"
# Encrypt the file using OpenSSL and AES-256-CBC with PBKDF2
openssl enc -aes-256-cbc -salt -pbkdf2 -in "$FILE_TO_UPLOAD" -out "$ENCRYPTED_FILE" -pass pass:"$ENCRYPTION_KEY"
if [ $? -ne 0 ]; then
    echo "Error: Failed to encrypt the file."
    exit 1
fi

# Upload the encrypted file to the S3 bucket
aws s3 cp "$ENCRYPTED_FILE" "s3://$BUCKET_NAME/"
if [ $? -eq 0 ]; then
    echo "Encrypted file '$ENCRYPTED_FILE' uploaded successfully to bucket '$BUCKET_NAME'."
else
    echo "Error: Failed to upload the encrypted file '$ENCRYPTED_FILE' to bucket '$BUCKET_NAME'."
    exit 1
fi

# Cleanup: Remove the encrypted file after upload
rm "$ENCRYPTED_FILE"
