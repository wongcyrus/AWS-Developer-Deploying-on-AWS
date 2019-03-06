export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
sudo yum install jq -y
DefaultSubnetId=$(aws ec2 describe-subnets --query 'Subnets[?DefaultForAz==`true`]' | jq .[0].SubnetId)

aws cloudformation create-stack --stack-name edx-project-stack --template-body file://cfn.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=Password,ParameterValue=P@ssw0rd ParameterKey=SourceBucket,ParameterValue=$SourceBucket  \
ParameterKey=DefaultSubnetId,ParameterValue=$DefaultSubnetId
 
aws cloudformation wait stack-create-complete --stack-name edx-project-stack
AWS_ACCESS_KEY_ID=$(aws cloudformation describe-stacks --stack-name edx-project-stack \
--query 'Stacks[0].Outputs[?OutputKey==`AccessKey`].OutputValue' --output text)
AWS_SECRET_ACCESS_KEY=$(aws cloudformation describe-stacks --stack-name edx-project-stack \
--query 'Stacks[0].Outputs[?OutputKey==`SecretKey`].OutputValue' --output text)
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
echo -e "${RED}Exercise 1.1 IAM and Cloud9 Stack created!${NOCOLOR}"   