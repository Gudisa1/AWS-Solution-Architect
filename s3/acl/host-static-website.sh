#!/bin/bash

# Check if a bucket name was provided
if [ -z "$1" ]; then
    echo "Error: No Bucket Name provided."
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

# Variables
BUCKET_NAME=$1
REGION="us-east-1"

# Create the S3 bucket
aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION

# Check if the bucket creation was successful
if [ $? -eq 0 ]; then
    echo "Bucket $BUCKET_NAME created successfully."
else
    echo "Error: Failed to create bucket $BUCKET_NAME."
    exit 1
fi

# Disable Block Public Access settings to allow public access through a policy
aws s3api put-public-access-block --bucket $BUCKET_NAME --public-access-block-configuration '{
    "BlockPublicAcls": false,
    "IgnorePublicAcls": false,
    "BlockPublicPolicy": false,
    "RestrictPublicBuckets": false
}'

# Check if disabling Block Public Access was successful
if [ $? -eq 0 ]; then
    echo "Public access settings adjusted for bucket $BUCKET_NAME."
else
    echo "Error: Failed to adjust public access settings for $BUCKET_NAME."
    exit 1
fi

# Set a bucket policy to allow public read access
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::'"$BUCKET_NAME"'/*"
        }
    ]
}'

# Check if the bucket policy was successfully applied
if [ $? -eq 0 ]; then
    echo "Bucket policy set successfully for bucket $BUCKET_NAME."
else
    echo "Error: Failed to set bucket policy for $BUCKET_NAME."
    exit 1
fi

echo "Script execution completed."
