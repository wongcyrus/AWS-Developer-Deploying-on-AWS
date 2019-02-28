export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId

# aws ssm put-parameter --name "TEST-DATABASE-MASTER-PASSWORD" --value 'Passw0rd' --type "SecureString"

# aws s3api create-bucket --bucket $SourceBucket
# sleep 5
# aws s3 sync . s3://$SourceBucket --exclude "*" --include "*.yaml"
# aws cloudformation create-stack --stack-name edx-project-codebuild-prepare-stack --template-body file://codebuild.yaml \
# --capabilities CAPABILITY_NAMED_IAM \
# --parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
# ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying \
# ParameterKey=CodeBuildProjectName,ParameterValue=Prepare
# aws cloudformation wait stack-create-complete --stack-name edx-project-codebuild-prepare-stack
# echo "CodeBuild Prepare Stack created!"

aws cloudformation update-stack --stack-name edx-project-codepipeline-stack --template-body file://codepipeline.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=SourceBucket,ParameterValue=$SourceBucket \
ParameterKey=CodeCommitRepoName,ParameterValue=edX-Deploying
aws cloudformation wait  stack-update-complete --stack-name edx-project-codepipeline-stack
echo "CodePipeline Stack updated!"