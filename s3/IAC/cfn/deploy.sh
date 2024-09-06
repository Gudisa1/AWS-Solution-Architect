#!/usr/bin/env bash


echo "Deploy s3 bucket via CF"
STACK_NAME="cfn-s3-simple"

aws cloudformation deploy \
--template-file template.yaml \
--region us-east-1 \
--stack-name $STACK_NAME