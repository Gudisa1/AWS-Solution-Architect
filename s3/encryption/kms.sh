#!/bin/bash
# Check if a bucket name and file were provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: No bucket name or file provided."
    echo "Usage: $0 <bucket-name> <file-to-upload>"
    exit 1
fi

# Variables
BUCKET_NAME=$1
FILE_TO_UPLOAD=$2
REGION="us-east-1"
KMS_KEY_ID=$KEY_ID  # You can replace this with your specific KMS key ARN or alias

# Create the S3 bucket
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION"

# Check if the bucket creation was successful
if [ $? -eq 0 ]; then
    echo "Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
    echo "Error: Failed to create bucket '$BUCKET_NAME'."
    exit 1
fi

# Upload the file to the bucket with SSE-KMS encryption
# The file will be encrypted using AWS KMS.
aws s3 cp "$FILE_TO_UPLOAD" "s3://$BUCKET_NAME/" --sse aws:kms --sse-kms-key-id "$KMS_KEY_ID"

# Check if the file upload was successful
if [ $? -eq 0 ]; then
    echo "File '$FILE_TO_UPLOAD' uploaded successfully to bucket '$BUCKET_NAME' with SSE-KMS encryption."
    
    # Optionally, check the encryption status of the uploaded object
    ENCRYPTION_STATUS=$(aws s3api head-object --bucket "$BUCKET_NAME" --key "$(basename $FILE_TO_UPLOAD)" --query "ServerSideEncryption" --output text)
    
    if [ "$ENCRYPTION_STATUS" == "aws:kms" ]; then
        echo "The file is encrypted with KMS as per the specified settings."
    else
        echo "The file encryption status is: $ENCRYPTION_STATUS"
    fi
else
    echo "Error: Failed to upload file '$FILE_TO_UPLOAD' to bucket '$BUCKET_NAME'."
    exit 1
fi
