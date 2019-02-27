export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId
aws s3api create-bucket --bucket $SourceBucket
sleep 5
aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
GitCloneUrlHttp=$(aws cloudformation describe-stacks --stack-name edx-project-codecommit-stack \
--query 'Stacks[0].Outputs[?OutputKey==`GitCloneUrlHttp`].OutputValue' --output text)
aws cloudformation create-stack --stack-name edx-project-codebuild-stack --template-body file://codebuild.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying
aws cloudformation wait stack-create-complete --stack-name edx-project-codebuild-stack
echo "CodeBuild Stack created!"