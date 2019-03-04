export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

aws s3api create-bucket --bucket $SourceBucket
sleep 5
aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
aws cloudformation create-stack --stack-name edx-project-pipeline-event-stack --template-body file://sns.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying \
ParameterKey=Email,ParameterValue=0123456789@stu.vtc.edu.hk

aws cloudformation wait stack-create-complete --stack-name edx-project-pipeline-event-stack
echo "Pipeline SNS and Event Stack created!"