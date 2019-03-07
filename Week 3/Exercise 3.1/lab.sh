cd ~/environment
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-cfn.zip -O ~/ex-cfn.zip
unzip -o ~/ex-cfn.zip
yes | cp -rf "AWS-Developer-Deploying-on-AWS/Week 2/Exercise 3.1/edx-provision.yaml" Templates/edx-provision.yaml
git add *
git commit -m "adding CFN to the pipeline"
git push origin dev
echo -e "${RED}Exercise 3.1 Completed Git Tasks!${NOCOLOR}"   