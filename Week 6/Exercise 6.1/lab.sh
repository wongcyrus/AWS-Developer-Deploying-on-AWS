cd ~/environment
git checkout dev
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-ja-jp.zip -O ~/ex-ja-jp.zip
unzip -o ~/ex-ja-jp.zip
sudo pip-3.6 install -r FlaskApp/requirements.txt
cd SetupScripts/
PASSWORD=P@ssw0rd python3 database_populate.py