#!/bin/bash
#Creating Bucket
# Check if a bucket name was provided
if [ -z "$1" ]; then
    echo "Error: No bucket name provided."
    echo "Usage: $0 <bucket-name>"
    exit 1
fi

# Variables
BUCKET_NAME=$1
REGION="us-east-1"

# Create the S3 bucket
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION"

# Check if the bucket creation was successful
if [ $? -eq 0 ]; then
    echo "Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
    echo "Error: Failed to create bucket '$BUCKET_NAME'."
    exit 1
fi


# Disable Block Public Access settings to allow public access for static website hosting
aws s3api put-public-access-block --bucket "$BUCKET_NAME" --public-access-block-configuration '{
    "BlockPublicAcls": true,
    "IgnorePublicAcls": true,
    "BlockPublicPolicy": false,
    "RestrictPublicBuckets": false
}'

# Check if the public access settings were successfully updated
if [ $? -eq 0 ]; then
    echo "Public access settings adjusted for bucket '$BUCKET_NAME'."
else
    echo "Error: Failed to adjust public access settings for bucket '$BUCKET_NAME'."
    exit 1
fi

# Set a bucket policy to allow public read access
POLICY_FILE="bucket-policy.json"

# Create the policy JSON file with the bucket name
cat > "$POLICY_FILE" <<EOL
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$BUCKET_NAME/*"
    }
  ]
}
EOL

# Apply the bucket policy
aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy file://"$POLICY_FILE"

# Check if the policy was successfully applied
if [ $? -eq 0 ]; then
    echo "Bucket policy applied successfully to '$BUCKET_NAME'."
else
    echo "Error: Failed to apply bucket policy to '$BUCKET_NAME'."
    exit 1
fi


# Enable static website hosting
aws s3api put-bucket-website --bucket "$BUCKET_NAME" --website-configuration '{
    "IndexDocument": {
        "Suffix": "index.html"
    },
    "ErrorDocument": {
        "Key": "error.html"
    }
}'

# Check if the website hosting was successfully enabled
if [ $? -eq 0 ]; then
    echo "Static website hosting enabled for '$BUCKET_NAME'."
else
    echo "Error: Failed to enable static website hosting for '$BUCKET_NAME'."
    exit 1
fi

# List of files to upload
FILES=("index.html" "styles.css" "scripts.js")

# Check if the files exist and upload them
for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo "Uploading $FILE to S3 bucket $BUCKET_NAME..."
        aws s3 cp "$FILE" "s3://$BUCKET_NAME/"
    else
        echo "Error: $FILE does not exist."
    fi
done

#  the website URL
WEBSITE_URL="http://$BUCKET_NAME.s3-website.$REGION.amazonaws.com"

#  Print the website URL
echo "Files uploaded successfully. You can access your website at: $WEBSITE_URL"