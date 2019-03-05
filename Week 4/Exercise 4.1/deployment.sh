export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
aws cloudformation create-stack --stack-name edx-project-codebuild-finalprepare-stack --template-body file://codebuild.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying 
aws cloudformation wait stack-create-complete --stack-name edx-project-codebuild-finalprepare-stack
echo "CodeBuild Final Prepare Stack created!"

aws cloudformation create-stack --stack-name edx-project-finalcodepipeline-stack --template-body file://codepipeline.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying
aws cloudformation wait stack-create-complete --stack-name edx-project-finalcodepipeline-stack
echo "Final CodePipeline Stack created for Exercise 4.1!"