#!/bin/bash
export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId
aws s3api create-bucket --bucket $SourceBucket
sleep 5
