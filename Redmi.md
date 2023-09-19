#######Dữ Liệu cài Proxy squid####
sudo yum install -y wget
wget https://raw.githubusercontent.com/Jangiang/SquidPorxy/main/squid.sh
chmod +x squid.sh
./squid.sh
touch /etc/squid/passwd #create a file that will later store the username for the authentication.
chown squid: /etc/squid/passwd #set owner for password file
htpasswd /etc/squid/passwd giang 

############## config /etc/squid/squid.conf###############
nano /etc/squid/squid.conf

************ Bảo mật không phát hiện proxy*********************
via off
forwarded_for off
request_header_access Allow allow all 
request_header_access Authorization allow all 
request_header_access WWW-Authenticate allow all 
request_header_access Proxy-Authorization allow all 
request_header_access Proxy-Authenticate allow all 
request_header_access Cache-Control allow all 
request_header_access Content-Encoding allow all 
request_header_access Content-Length allow all 
request_header_access Content-Type allow all 
request_header_access Date allow all 
request_header_access Expires allow all 
request_header_access Host allow all 
request_header_access If-Modified-Since allow all 
request_header_access Last-Modified allow all 
request_header_access Location allow all 
request_header_access Pragma allow all 
request_header_access Accept allow all 
request_header_access Accept-Charset allow all 
request_header_access Accept-Encoding allow all 
request_header_access Accept-Language allow all 
request_header_access Content-Language allow all 
request_header_access Mime-Version allow all 
request_header_access Retry-After allow all 
request_header_access Title allow all 
request_header_access Connection allow all 
request_header_access Proxy-Connection allow all 
request_header_access User-Agent allow all 
request_header_access Cookie allow all 
request_header_access All deny all

********* Đăng nhập tk mk *******
auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/passwd
auth_param basic children 5
auth_param basic realm Squid Basic Authentication
auth_param basic credentialsttl 2 hours
acl auth_users proxy_auth REQUIRED
http_access allow auth_users

********** Hiện IP theo tùy thích**********
acl port2 myport 24051
acl port3 myport 24052
tcp_outgoing_address 2405:4803:e284:b720:3685:63a5:245c:e33f port2
tcp_outgoing_address 2405:4803:e284:b720:805e:fe1c:0a89:846c port3

********* ÁP dụng cho tất cả các port*****************
Đổi http_access deny all thành http_access allow all

############################# Add Port  #################
firewall-cmd --zone=public --add-port=3128/tcp --permanent
firewall-cmd --permanent --add-port=xxx/tcp
firewall-cmd --reload

########### KHỞI ĐỘNG KÈM TẮT SQUID###############
systemctl restart squid.service
service squid restart
systemctl enable squid
systemctl start squid
systemctl restart squid
systemctl restart network
systemctl status squid.service

############ CheK iP WAN#######
yum install wget
wget -O - -q https://checkip.amazonaws.com
