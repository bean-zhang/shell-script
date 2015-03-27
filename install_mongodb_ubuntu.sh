#!/usr/bin/sh
#
# Install MongoDB on Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#
cd ~
# Import the public key used by the package management system
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
# Create a list file for MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc) \ 
 "/mongodb-org/3.0 multiverse" | sudo tee \ 
 /etc/apt/sources.list.d/mongodb-org-3.0.list
# Reload local package database
apt-get update
# Install the MongoDB packages
apt-get install -y mongodb-org

