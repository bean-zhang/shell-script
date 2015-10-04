#!/bin/bash
#
# Install Ganglia Client Node on Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

# Install Ganglia Monitor
sudo apt-get install -y ganglia-monitor
# config gmond
gmond_conf=./unicast.gmond.conf
if [ -f "${gmond_conf}" ]
then
	sudo mv /etc/ganglia/gmond.conf /etc/ganglia/gmond.conf.bak
	sudo cp ${gmond_conf} /etc/ganglia/gmond.conf
fi
# restart gmond
#sudo service ganglia-monitor restart
