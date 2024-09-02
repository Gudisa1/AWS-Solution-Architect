#Creating a bucket

aws s3api create-bucket \
    --bucket gudisa-bucket \
    --region us-east-1


# Set public access block to allow public access for ACLs
aws s3api put-public-access-block \
    --bucket gudisa-bucket \
    --public-access-block-configuration '{
        "BlockPublicAcls": false,
        "IgnorePublicAcls": false,
        "BlockPublicPolicy": true,
        "RestrictPublicBuckets": true
    }'

aws s3api put-bucket-ownership-controls --bucket gudisa-bucket --ownership-controls '{
    "Rules": [
        {
            "ObjectOwnership": "BucketOwnerPreferred"
        }
    ]
}'



# Grant  read access USING AN ACL
aws s3api put-bucket-acl --bucket gudisa-bucket --grant-read 'id="CanonicalUserID"' --grant-read-acp 'id="CanonicalUserID"'




