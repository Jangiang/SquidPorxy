sudo yum update #update OS
sudo yum upgrade #upgrade OS
sudo yum install -y squid #install Squid
sudo yum -y install httpd-tools #install httpd-tools
sudo service squid start #start Squid
sudo chkconfig squid on #start Squid on boot
touch /etc/squid/passwd #create a file that will later store the username for the authentication.
chown squid: /etc/squid/passwd #set owner for password file
htpasswd /etc/squid/passwd proxyclient #create a user and set password