wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-codebuild.zip -O ~/ex-codebuild.zip
cd ~/environment/
git checkout dev
unzip -o ~/ex-codebuild.zip
git add *
git status
git commit -m "added codebuild buildspec for unittests"
git push origin dev
echo -e "${RED}Exercise 2.2 Completed Git Tasks!${NOCOLOR}"   