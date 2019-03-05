export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
aws cloudformation create-stack --stack-name edx-project-codecommit-stack --template-body file://codecommit.yaml \
--capabilities CAPABILITY_NAMED_IAM 
aws cloudformation wait stack-create-complete --stack-name edx-project-codecommit-stack
GitCloneUrlHttp=$(aws cloudformation describe-stacks --stack-name edx-project-codecommit-stack \
--query 'Stacks[0].Outputs[?OutputKey==`GitCloneUrlHttp`].OutputValue' --output text)
export GitCloneUrlHttp=GitCloneUrlHttp
echo "Git Clone Url"
echo "$GitCloneUrlHttp"