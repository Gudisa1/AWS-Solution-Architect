#!/usr/bin/env bash

# Check for bucket name
if [ -z "$1" ]; then
    echo "Error: No Bucket Name provided."
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

BUCKET_NAME=$1

# Directory containing the files
DIR="/workspace/AWS-Solution-Architect/s3/bashscript"

# Sync only files that start with "file"
echo "Syncing files that start with 'file' to S3 bucket: $BUCKET_NAME"
aws s3 sync "$DIR" "s3://$BUCKET_NAME/" --exclude "*" --include "file*"

# Check if the sync was successful
if [ $? -eq 0 ]; then
    echo "Files synced successfully to bucket '$BUCKET_NAME'."
else
    echo "Error: Failed to sync files to bucket '$BUCKET_NAME'."
fi
