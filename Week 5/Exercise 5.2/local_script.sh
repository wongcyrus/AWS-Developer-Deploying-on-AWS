echo "SSH into EC2 now!"
sudo tail /var/log/nginx/access.log
sudo yum install -y awslogs
region=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/\(.*\)[a-z]/\1/')
echo $region
sudo sed "s/\$region/$region/g" -i /etc/awslogs/awscli.conf
sudo cat /etc/awslogs/awscli.conf
sudo -s
cat > /etc/awslogs/config/FlaskAppAccessLogs.conf <<- "EOF"
[/var/log/nginx/access.log]
initial_position = start_of_file
file = /var/log/nginx/access.log
datetime_format = %d/%b/%Y:%H:%M:%S %z
buffer_duration = 5000
log_group_name = FlaskApp-Frontends-access-log
log_stream_name = {instance_id}
EOF
sudo service awslogs stop
sudo service awslogs start
sudo chkconfig awslogs on
sudo service awslogs status