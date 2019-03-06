cd ~/environment
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-cloud9.zip -O ~/ex-cloud9.zip
unzip -o ~/ex-cloud9.zip
sudo pip-3.6 install -r FlaskApp/requirements.txt
sh "setup_mysql.sh"
cd ~/environment
PASSWORD=P@ssw0rd python3 SetupScripts/database_populate.py
export DATABASE_HOST=localhost
export DATABASE_USER=web_user
export DATABASE_PASSWORD=P@ssw0rd
export DATABASE_DB_NAME=routes
python3 FlaskApp/application.py