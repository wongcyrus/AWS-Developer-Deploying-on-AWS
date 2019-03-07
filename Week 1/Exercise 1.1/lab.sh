sh "setup_mysql.sh"
cd ~/environment
export DATABASE_HOST=localhost
export DATABASE_USER=web_user
export DATABASE_PASSWORD=P@ssw0rd
export DATABASE_DB_NAME=routes
python3 FlaskApp/application.py