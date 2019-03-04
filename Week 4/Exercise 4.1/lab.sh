cd ~/environment
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-finalpipeline.zip -O ~/ex-finalpipeline.zip
unzip -o ~/ex-finalpipeline.zip
yes | cp -rf "AWS-Developer-Deploying-on-AWS/Week 4/Exercise 4.1/edx-final.yaml" Templates/edx-final.yaml
git checkout dev
git add *
git commit -m "added edx-final template"
git push origin dev
aws ssm put-parameter --name "FINAL-DATABASE-MASTER-PASSWORD" --value 'Passw0rd' --type "SecureString"
aws ssm put-parameter --name "FINAL-DATABASE-WEB-USER-PASSWORD" --value 'Passw0rd' --type "SecureString"
cd ~/environment
git checkout -b final
git push origin final
# git log