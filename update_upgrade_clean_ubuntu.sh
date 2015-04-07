#!/bin/bash
#
# update, upgrade, remove and clean Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
apt-get update
apt-get upgrade -y
apt-get dis-upgrade -y
apt-get autoremove
apt-get autoclean

