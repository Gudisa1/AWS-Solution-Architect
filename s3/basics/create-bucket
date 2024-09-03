#!/usr/bin/env bash

# Check for bucket name
if [ -z  "$1" ]; then
    echo "Error: No Bucket Name provided."
    echo "Usage: $0 -n <bucket-name> -r <region>"
    exit 1
fi
BUCKET_NAME=$1
aws s3api create-bucket --bucket $BUCKET_NAME \
--query Location \
--output text

