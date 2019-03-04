export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

aws s3api create-bucket --bucket $SourceBucket
sleep 5
aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
aws cloudformation create-stack --stack-name edx-project-es-stack --template-body file://elasticsearch.yaml \
--capabilities CAPABILITY_NAMED_IAM 

aws cloudformation wait stack-create-complete --stack-name edx-project-es-stack
echo "Elasticsearch Stack created!"