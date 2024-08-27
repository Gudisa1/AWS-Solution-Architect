#!/usr/bin/env bash

# Get the most recently created S3 bucket in JSON format
echo "Getting the most recently created S3 bucket in your AWS account:"
LATEST_BUCKET=$(aws s3api list-buckets --query "Buckets | sort_by(@, &CreationDate) | [-1]" --output json)

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Most recently created bucket:"
    echo "$LATEST_BUCKET"
else
    echo "Error: Failed to retrieve the most recent bucket."
fi
