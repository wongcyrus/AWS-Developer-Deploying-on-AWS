cd ~/environment
sudo service mysqld start
sudo chkconfig mysqld on
mysqladmin -u root password P@ssw0rd
sed -i 's/REPLACE_WITH_WEB_USER_PASSWORD/P@ssw0rd/g' SetupScripts/create_schema.sql
mysql -h localhost -u root -pP@ssw0rd < SetupScripts/create_schema.sql