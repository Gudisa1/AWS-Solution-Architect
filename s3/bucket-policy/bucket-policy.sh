
#Creating Bucket
aws s3api create-bucket \
    --bucket gudisa-bucket \
    --region us-east-1

#The aws Cli command that will allow access to other AWS accounts using the json policy
 aws s3api put-bucket-policy --bucket gudisa-bucket --policy file:///AWS-Solution-Architect/s3/bucket-policy/bucket-policy.json    