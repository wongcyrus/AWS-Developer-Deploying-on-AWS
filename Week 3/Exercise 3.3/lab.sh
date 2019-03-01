aws ssm put-parameter --name "TEST-DATABASE-WEB-USER-PASSWORD" --value 'P@ssw0rd' --type "SecureString"
cd ~/environment
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-codedeploy.zip -O ~/ex-codedeploy.zip
unzip -o ~/ex-codedeploy.zip
git add *
git commit -m "codedeploy exercise"
git push origin dev