#!/usr/bin/env bash

# Function to display usage
usage() {
    echo "Usage: $0 [options] <bucket-name> [object-key]"
    echo ""
    echo "Options:"
    echo "  -r                     Recursively delete all objects in the bucket"
    echo ""
    echo "Arguments:"
    echo "  <bucket-name>          The name of the S3 bucket"
    echo "  [object-key]           The key of the specific object to delete (optional)"
    echo ""
    echo "Description:"
    echo "  If the -r option is provided, the script will delete all objects in the specified bucket."
    echo "  If the -r option is not provided, the script will delete the specified object only."
    echo ""
    exit 1
}
# Parse command line arguments
REC=0
while getopts ":r" opt; do
    case ${opt} in
        r )
            REC=1
            ;;
        \? )
            usage
            ;;
    esac
done
shift $((OPTIND -1))

# Check if bucket name is provided
if [ -z "$1" ]; then
    usage
fi

BUCKET_NAME=$1

# If recursive flag is set
if [ $REC -eq 1 ]; then
    echo "Recursively deleting all objects in bucket: $BUCKET_NAME"
    aws s3 rm "s3://$BUCKET_NAME/" --recursive
    if [ $? -eq 0 ]; then
        echo "All objects deleted successfully from bucket '$BUCKET_NAME'."
    else
        echo "Error: Failed to delete all objects from bucket '$BUCKET_NAME'."
    fi
    exit 0
fi

# Check if object key is provided
if [ -z "$2" ]; then
    echo "Error: Object key not provided for deletion."
    usage
fi

OBJECT_KEY=$2

# Delete the object from the S3 bucket
echo "Deleting object '$OBJECT_KEY' from S3 bucket: $BUCKET_NAME"
aws s3api delete-object --bucket "$BUCKET_NAME" --key "$OBJECT_KEY"

# Check if the deletion was successful
if [ $? -eq 0 ]; then
    echo "Object '$OBJECT_KEY' deleted successfully from bucket '$BUCKET_NAME'."
else
    echo "Error: Failed to delete object '$OBJECT_KEY' from bucket '$BUCKET_NAME'."
fi
