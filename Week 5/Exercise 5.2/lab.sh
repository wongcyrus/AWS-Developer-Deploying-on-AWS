cd ~/environment
mkdir -p ~/ssh-keys
cd ~/ssh-keys
ssh-keygen -t rsa -f ~/ssh-keys/edx-temp-key -N ''
cat edx-temp-key
chmod 400 edx-temp-key
cat edx-temp-key.pub
aws ec2 import-key-pair --key-name edx-temp-public-key --public-key-material file://edx-temp-key.pub
cd ~/environment
git checkout dev
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-cwlogs.zip -O ~/ex-cwlogs.zip
unzip -o ~/ex-cwlogs.zip
yes | cp -rf "AWS-Developer-Deploying-on-AWS/Week 5/Exercise 5.2/edx-provision.yaml" Templates/edx-provision.yaml
git add *
git commit -m "adding SSH capabilities to the TEST-WebServerInstance"
git push origin dev
echo -e "${RED}Exercise 5.2 Completed Git Tasks!${NOCOLOR}"  