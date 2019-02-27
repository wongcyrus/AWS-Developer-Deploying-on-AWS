USERNAME=student
EMAIL=123456789@stu.vtc.edu.hk
cd ~/environment
git init
git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"
git checkout -b dev
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-codecommit.zip -O ~/ex-codecommit.zip
unzip -o ~/ex-codecommit.zip
git add .gitignore
git add .
git status
git commit -m "first commit of the routes application"
# git log