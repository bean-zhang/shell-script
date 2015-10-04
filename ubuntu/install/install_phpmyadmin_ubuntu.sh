#!/bin/bash
#
# Install phpMyAdmin on Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

# Replace MySQL root password with your own
MYSQL_ROOT_PASSWORD=$1

# Replace phpMyAdmin password with your own
PHPMYADMIN_PASSWORD=$2

cd ~
apt-get update
apt-get upgrade -y

echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" \ 
 | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" \ 
 | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-user string root" \ 
 | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $MYSQL_ROOT_PASSWORD" \ 
 | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $PHPMYADMIN_PASSWORD" \ 
 | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $PHPMYADMIN_PASSWORD"\
 | debconf-set-selections

# Install phpMyAdmin
apt-get install -y phpmyadmin

# Link phpMyAdmin to Apache2 directory
#ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin

php5enmod mcrypt

service apache2 restart


