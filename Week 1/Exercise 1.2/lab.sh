wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-beanstalk.zip -O ~/ex-beanstalk.zip
cd ~/environment
unzip -o ~/ex-beanstalk.zip
sed -i 's/REPLACE_WITH_ROOT_PASSWORD/P@ssw0rd/g' FlaskApp/.ebextensions/populate.config
sed -i 's/REPLACE_WITH_WEB_USER_PASSWORD/P@ssw0rd/g' FlaskApp/.ebextensions/populate.config
cd ~/environment/FlaskApp/
zip -r ~/environment/eb.zip requirements.txt *.py static/ templates/ .ebextensions/