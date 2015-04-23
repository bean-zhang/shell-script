#!/bin/bash
#
# Install Ganglia Master Node on Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
# Install Ganglia Monitor, RRDtool, Gmetad and the Ganglia web front end
apt-get install -y ganglia-monitor rrdtool gmetad ganglia-webfrontend
# Set up the online graphical dashboard by copying the Ganglia web front end
# configuration file to the Apache sites-enabled folder
cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf
# 
