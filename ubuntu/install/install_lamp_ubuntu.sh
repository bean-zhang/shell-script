#!/bin/bash
#
# Install LAMP on Ubuntu
# Refer to https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-14-04
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
apt-get update
apt-get upgrade -y

# Install Apache2
apt-get install -y apache2

# Backup /etc/apache2/apache2.conf
cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak

echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

# Install php5
apt-get install -y php5
# Install Apache2 php5 lib
apt-get install -y libapache2-mod-php5

# Replace the MySQL root password with your own
MYSQL_ROOT_PASSWORD=$1

# 
echo mysql-server mysql-server/root_password password \ 
 $MYSQL_ROOT_PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again password \ 
 $MYSQL_ROOT_PASSWORD | debconf-set-selections

# Install MySQL server
apt-get install -y mysql-server
# Install Apache2 MySQL lib
apt-get install -y libapache2-mod-auth-mysql
# Install php5 MySQL lib
apt-get install -y php5-mysql

# Start MySQL on system startup
update-rc.d mysql defaults

# Backup /etc/mysql/my.cnf
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.bak

# Set MySQL default character utf8
sed -i '/^\[mysqld\]/a\collation-server=utf8_general_ci' /etc/mysql/my.cnf
sed -i '/^\[mysqld\]/a\character-set-server=utf8' /etc/mysql/my.cnf

# Restart Apache2
service apache2 restart
# Restart MySQL
service mysql restart

# Create info.php
echo "<?php phpinfo() ?>" > /var/www/html/info.php

