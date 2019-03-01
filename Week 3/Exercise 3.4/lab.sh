cd ~/environment
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-acctests.zip -O ~/ex-acctests.zip
unzip -o ~/ex-acctests.zip
git add *
git commit -m "codedeploy exercise"
git push origin dev