#!/bin/bash

# Check if a bucket name, file, and encryption key file were provided
if [ -z "$1" ] || [ -z "$2"] || [ -z "$3" ]; then
    echo "Error: No bucket name, file, or encryption key file provided."
    echo "Usage: $0 <bucket-name> <file-to-upload> <encryption-key-file>"
    exit 1
fi

# Variables
BUCKET_NAME="$1"
FILE_TO_UPLOAD="$2"
ENCRYPTION_KEY_FILE="$3"
REGION="us-east-1"  # Replace with your desired region

# Check if the encryption key file exists
if [ ! -f "$ENCRYPTION_KEY_FILE" ]; then
    echo "Error: Encryption key file '$ENCRYPTION_KEY_FILE' not found."
    exit 1
fi

# Read the encryption key from the file
ENCRYPTION_KEY=$(cat "$ENCRYPTION_KEY_FILE")

# Encode the encryption key to Base64
ENCRYPTION_KEY_BASE64=$(echo -n "$ENCRYPTION_KEY" | base64)

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

# Upload the file with SSE-C encryption using s3api
aws s3api put-object --bucket "$BUCKET_NAME" --key "$(basename "$FILE_TO_UPLOAD")" \
  --body "$FILE_TO_UPLOAD" \
  --sse-customer-algorithm AES256 \
  --sse-customer-key "$ENCRYPTION_KEY_BASE64"

# Check if the file upload was successful
if [ $? -eq 0 ]; then
    echo "File '$FILE_TO_UPLOAD' uploaded successfully to bucket '$BUCKET_NAME' with SSE-C encryption."
else
    echo "Error: Failed to upload file '$FILE_TO_UPLOAD' to bucket '$BUCKET_NAME'."
    exit 1
fi


#ANYONE WITH AN OPTIMIZED SOLUTION IS WELCOME HERE
