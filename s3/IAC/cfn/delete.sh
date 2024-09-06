#!/bin/bash

# Set the name of the stack to delete
STACK_NAME="your-stack-name"  # Replace with your stack name

# Delete the CloudFormation stack
aws cloudformation delete-stack --stack-name "$STACK_NAME"

# Optionally, wait for the deletion to complete
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME"

echo "Stack $STACK_NAME deleted."
