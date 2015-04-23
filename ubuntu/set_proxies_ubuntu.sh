#!/bin/bash
#
# Set the proxies.
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#
cp ~/git/proxy.sh /etc/profile.d/
cp ~/git/95proxies /etc/apt/apt.conf.d/

source /etc/profile.d/proxy.sh
source /etc/apt/apt.conf.d/95proxies

# Verify that apt has picked up these settings via this command
apt-config dump  | grep -i proxy # lists the proxy settings
