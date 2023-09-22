yum remove net-tools.x86_64 -y
service network restart
sudo service network restart
sudo yum localinstall net-tools-2.0-0.25.20131004git.el7.x86_64.rpm -y
systemctl restart network.service
sudo service network restart
