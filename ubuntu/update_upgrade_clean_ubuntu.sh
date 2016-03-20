#!/bin/bash
#
# update, upgrade, remove and clean Ubuntu
#
# author: Bean Zhang
# email: sjtuzb@gmail.com
#

cd ~
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
apt-get autoclean -y

