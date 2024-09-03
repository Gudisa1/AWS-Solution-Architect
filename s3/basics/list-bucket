#!/usr/bin/env bash

# List all S3 buckets with creation dates, sorted by date (latest first), and output in JSON format
echo "Listing all S3 buckets in your AWS account (latest first) in JSON format:"
aws s3api list-buckets --query "Buckets | sort_by(@, &CreationDate) | reverse(@)" --output json

# Check if the listing was successful
if [ $? -eq 0 ]; then
    echo "S3 buckets listed successfully."
else
    echo "Error: Failed to list S3 buckets."
fi
