#!/bin/bash
#
# Install WordPress on Ubuntu
# Refer to https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-14-04
# 
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
# Create database and grant privileges
mysql -u<username> -p<password> -e "

    CREATE DATABASE wordpress;
    CREATE USER <wordpress_username>@localhost IDENTIFIED BY '<wordpress_password>';
    GRANT ALL PRIVILEGES ON wordpress.* TO <wordpress_username>@localhost;
    FLUSH PRIVILEGES;
\q"

# Download wordpress and uncompress
cd ~/git
wget https://cn.wordpress.org/wordpress-4.4.2-zh_CN.tar.gz
#wget https://cn.wordpress.org/wordpress-4.4.2-zh_CN.zip
tar xzvf wordpress-4.4.2-zh_CN.tar.gz

# Install necessary packages
sudo apt-get update
sudo apt-get install php5-gd libssh2-php

# Copy wordpress to www dirctory
sudo rsync -avP ./wordpress /var/www/html/
# Config wordpress
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
# Make necessary dirctory
mkdir -p ./wp-content/uploads
sudo chown -R :www-data ./wp-content/uploads
# Enable rewrite module
sudo a2enmod rewrite
sudo service apache2 restart
# Create .htaccess file
touch /var/www/html/.htaccess
sudo chown :www-data /var/www/html/.htaccess
chmod 664 /var/www/html/.htaccess

