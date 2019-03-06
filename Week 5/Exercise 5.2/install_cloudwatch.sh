watch -n 30 aws codepipeline list-pipeline-executions --pipeline-name ci-cd-pipeline --query pipelineExecutionSummaries[0] | \
jq '.status=="Succeeded" and .sourceRevisions[0].revisionSummary=="adding SSH capabilities to the TEST-WebServerInstance\n"' \
| grep 'true'

instance_id=$(aws cloudformation describe-stacks --stack-name TEST-Stack \
--query 'Stacks[0].Outputs[?OutputKey==`TESTWebServerInstanceId`].OutputValue' --output text)
sudo yum install jq -y
public_ip=$(aws ec2 describe-instances --instance-id $instance_id | jq -r .Reservations[].Instances[].PublicIpAddress)
echo $public_ip
ssh -o StrictHostKeyChecking=no -i ~/ssh-keys/edx-temp-key ec2-user@$public_ip 'bash -s' < local_script.sh