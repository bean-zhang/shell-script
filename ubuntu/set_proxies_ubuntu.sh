#!/bin/bash
#
# Set the proxies.
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#
cp ./../proxy.sh /etc/profile.d/
cp ./../95proxies /etc/apt/apt.conf.d/

source /etc/profile.d/proxy.sh
source /etc/apt/apt.conf.d/95proxies

