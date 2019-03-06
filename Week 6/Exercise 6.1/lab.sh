cd ~/environment
git checkout dev
wget https://us-west-2-tcdev.s3.amazonaws.com/courses/AWS-100-ADD/v1.0.0/exercises/ex-ja-jp.zip -O ~/ex-ja-jp.zip
unzip -o ~/ex-ja-jp.zip
sudo pip-3.6 install -r FlaskApp/requirements.txt
sed -i 's/REPLACE_WITH_WEB_USER_PASSWORD/P@ssw0rd/g' SetupScripts/create_schema.sql
mysql -h localhost -u root -pP@ssw0rd < SetupScripts/create_schema.sql
cd SetupScripts/
PASSWORD=P@ssw0rd python3 database_populate.py
cd ~/environment/FlaskApp
sh "local_build.sh"
cd ~/environment/
git checkout dev
git add *
git commit -m "adding japanese language update"
git push origin dev
# git log
git checkout final
git merge dev
git push origin final