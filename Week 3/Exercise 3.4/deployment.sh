export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
aws cloudformation create-stack --stack-name edx-project-codebuild-acctests-stack --template-body file://codebuild.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying 
aws cloudformation wait stack-create-complete --stack-name edx-project-codebuild-acctests-stack
echo -e "${RED}Exercise 3.4 CodeBuild AcceptanceTest Stack created!${NOCOLOR}"  

aws cloudformation update-stack --stack-name edx-project-codepipeline-stack --template-body file://codepipeline.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying
aws cloudformation wait  stack-update-complete --stack-name edx-project-codepipeline-stack
echo -e "${RED}Exercise 3.4 CodePipeline Stack updated!${NOCOLOR}"  