#!/usr/bin/env bash

# Check for bucket name and file to upload
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Bucket Name or File to Upload not provided."
    echo "Usage: $0 <bucket-name> <file-to-upload>"
    exit 1
fi

BUCKET_NAME=$1
FILE_TO_UPLOAD=$2

# Check if the file exists
if [ ! -f "$FILE_TO_UPLOAD" ]; then
    echo "Error: File '$FILE_TO_UPLOAD' not found."
    exit 1
fi

# Put the object into the S3 bucket
echo "Uploading '$FILE_TO_UPLOAD' to S3 bucket '$BUCKET_NAME'"
aws s3api put-object --bucket "$BUCKET_NAME" --key "$(basename "$FILE_TO_UPLOAD")" --body "$FILE_TO_UPLOAD" --output text

# Check if the upload was successful
if [ $? -eq 0 ]; then
    echo "File '$FILE_TO_UPLOAD' uploaded successfully to bucket '$BUCKET_NAME'."
else
    echo "Error: Failed to upload file '$FILE_TO_UPLOAD' to bucket '$BUCKET_NAME'."
fi
