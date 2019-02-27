export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId
aws s3api create-bucket --bucket $SourceBucket
sleep 5
aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
aws s3 cp ~/environment/eb.zip s3://$SourceBucket
sudo yum install jq -y
PlatformArn=$(aws elasticbeanstalk list-platform-versions | jq '.PlatformSummaryList |.[] | .PlatformArn' | grep "Python 3.6")
aws cloudformation create-stack --stack-name edx-project-eb-stack --template-body file://beanstalk.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=PlatformArn,ParameterValue="$PlatformArn"
aws cloudformation wait stack-create-complete --stack-name edx-project-eb-stack
ElasticBeanstalkUrl=$(aws cloudformation describe-stacks --stack-name edx-project-eb-stack \
--query 'Stacks[0].Outputs[?OutputKey==`ElasticBeanstalkUrl`].OutputValue' --output text)
export ElasticBeanstalkUrl=ElasticBeanstalkUrl
