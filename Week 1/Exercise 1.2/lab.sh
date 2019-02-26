cd ~/environment
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-cloud9.zip -O ~/ex-cloud9.zip
unzip -o ~/ex-cloud9.zip
sudo pip-3.6 install -r FlaskApp/requirements.txt
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-beanstalk.zip -O ~/ex-beanstalk.zip
unzip -o ~/ex-beanstalk.zip
sed -i 's/REPLACE_WITH_ROOT_PASSWORD/P@ssw0rd/g' FlaskApp/.ebextensions/populate.config
sed -i 's/REPLACE_WITH_WEB_USER_PASSWORD/P@ssw0rd/g' FlaskApp/.ebextensions/populate.config
cd ~/environment/FlaskApp/
zip -r ~/environment/eb.zip requirements.txt *.py static/ templates/ .ebextensions/