#!/usr/bin/env bash

# Check for bucket name
if [ -z "$1" ]; then
    echo "Error: No Bucket Name provided."
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

BUCKET_NAME=$1

# List objects in the S3 bucket
echo "Listing objects in S3 bucket: $BUCKET_NAME"
aws s3api list-objects --bucket "$BUCKET_NAME" --output table

# Check if the listing was successful
if [ $? -eq 0 ]; then
    echo "Objects listed successfully."
else
    echo "Error: Failed to list objects in bucket '$BUCKET_NAME'."
fi
