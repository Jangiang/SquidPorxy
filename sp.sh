yum remove net-tools.x86_64 -y
yum install network-scripts -y
service network restart
wget https://github.com/Jangiang/SquidPorxy/raw/main/net-tools-2.0-0.25.20131004git.el7.x86_64.rpm
sudo yum localinstall net-tools-2.0-0.25.20131004git.el7.x86_64.rpm -y
service network restart
