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
IAM_USER_ARN="arn:aws:iam::ACCOUNT_ID:user/USERNAME" # Replace with the actual ARN of the IAM user

# Create the S3 bucket
aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION

# Check if the bucket creation was successful
if [ $? -eq 0 ]; then
    echo "Bucket $BUCKET_NAME created successfully."
else
    echo "Error: Failed to create bucket $BUCKET_NAME."
    exit 1
fi

# Disable Block Public Access settings to allow ACLs
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

# Set object ownership to BucketOwnerPreferred
aws s3api put-bucket-ownership-controls --bucket $BUCKET_NAME --ownership-controls '{
    "Rules": [
        {
            "ObjectOwnership": "BucketOwnerPreferred"
        }
    ]
}'

# Check if the object ownership setting was successfully applied
if [ $? -eq 0 ]; then
    echo "Object ownership set to BucketOwnerPreferred for bucket $BUCKET_NAME."
else
    echo "Error: Failed to set object ownership for bucket $BUCKET_NAME."
    exit 1
fi

# Grant the IAM user access to the bucket using an ACL
aws s3api put-bucket-acl --bucket $BUCKET_NAME --grant-full-control "$IAM_USER_ARN"

# Check if the ACL was successfully applied
if [ $? -eq 0 ]; then
    echo "ACL applied successfully for bucket $BUCKET_NAME to grant access to $IAM_USER_ARN."
else
    echo "Error: Failed to apply ACL for bucket $BUCKET_NAME."
    exit 1
fi

echo "Script execution completed."
