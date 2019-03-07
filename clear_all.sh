export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
aws cloudformation delete-stack --role-arn arn:aws:iam::$AWSAccountId:role/edx-project-codepipeline-stack-CloudFormation --stack-name TEST-Stack
aws cloudformation delete-stack --role-arn arn:aws:iam::$AWSAccountId:role/edx-project-finalcodepipeline-stack-CloudFormation --stack-name FINAL-Stack

for stack in $(aws cloudformation list-stacks --output text --query 'StackSummaries[?contains(StackName, `edx-project-`) && (StackStatus==`CREATE_COMPLETE`||StackStatus==`UPDATE_COMPLETE`) && (!ParentId)].[StackName]') ; \
do aws cloudformation delete-stack --stack-name $stack --output text; done

SourceBucket=sourcebucketname$AWSAccountId
aws s3 rb s3://$SourceBucket --force

aws logs delete-log-group --log-group-name FlaskApp-Frontends-access-log