#!/bin/sh
random() {
	tr </dev/urandom -dc A-Za-z0-9 | head -c5
	echo
}

array=(1 2 3 4 5 6 7 8 9 0 a b c d e f)
gen64() {
	ip64() {
		echo "${array[$RANDOM % 16]}${array[$RANDOM % 16]}${array[$RANDOM % 16]}${array[$RANDOM % 16]}"
	}
	echo "$1:$(ip64):$(ip64):$(ip64):$(ip64)"
}
install_3proxy() {
    yum update -y 
	yum install wget -y
	sudo yum install -y squid
	sudo yum -y install httpd-tools
	sudo service squid start
	sudo chkconfig squid on
	touch /etc/squid/passwd
	chown squid: /etc/squid/passwd
  	htpasswd /etc/squid/passwd giang
	giangc0i
	giangc0i
	
}
