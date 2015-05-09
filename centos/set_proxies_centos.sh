#!/bin/bash
#
# Set the proxies on CentOS
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#
cp ~/git/proxy.sh /etc/profile.d/
#cp ~/git/95proxies /etc/apt/apt.conf.d/

source /etc/profile.d/proxy.sh

# Verify that apt has picked up these settings via this command
#apt-config dump  | grep -i proxy # lists the proxy settings

# Backup /etc/yum.conf
cp /etc/yum.conf /etc/yum.conf.bak
# Configure yum
echo "proxy=http://proxy.example.com:8080/" >> /etc/yum.conf

