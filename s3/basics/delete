#!/usr/bin/env bash
# Check for bucket name
if [ -z "$1" ]; then
    echo "Error: No Bucket Name provided."
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

BUCKET_NAME=$1
# Delete the S3 bucket
echo "Deleting S3 bucket: $BUCKET_NAME"
aws s3api delete-bucket --bucket "$BUCKET_NAME" --output text

# Check if the deletion was successful
if [ $? -eq 0 ]; then
    echo "Bucket '$BUCKET_NAME' deleted successfully."
else
    echo "Error: Failed to delete bucket '$BUCKET_NAME'."
fi
