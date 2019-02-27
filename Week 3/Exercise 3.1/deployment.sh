export AWS_DEFAULT_REGION=us-east-1
AWSAccountId=$(aws sts get-caller-identity --query 'Account' --output text)
SourceBucket=sourcebucketname$AWSAccountId
aws s3api create-bucket --bucket $SourceBucket
sleep 5
aws cloudformation create-stack --stack-name TEST-Stack --template-body file://edx-provision.yaml \
--capabilities CAPABILITY_NAMED_IAM \
--parameters ParameterKey=DBInstanceMasterPassword,ParameterValue=Passw0rd 
aws cloudformation wait stack-create-complete --stack-name TEST-Stack
echo "TEST-Stack created!"