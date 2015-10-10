#!/bin/bash
#
# Install Ganglia Master Node on Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

# Install Ganglia Monitor, RRDtool, Gmetad and the Ganglia web front end
sudo apt-get install -y ganglia-monitor rrdtool gmetad ganglia-webfrontend
# Set up the online graphical dashboard by copying the Ganglia web front end
# configuration file to the Apache sites-enabled folder
sudo cp /etc/ganglia-webfrontend/apache.conf /etc/apache2/sites-enabled/ganglia.conf
# config gmetad and gmond
gmetad_conf=./unicast.gmetad.conf
gmond_conf=./unicast.gmond.conf
if [ -f "${gmetad_conf}" ]
then
	sudo mv /etc/ganglia/gmetad.conf /etc/ganglia/gmetad.conf.bak
	sudo cp ${gmetad_conf} /etc/ganglia/gmetad.conf
fi
if [ -f "${gmond_conf}" ]
then
	sudo mv /etc/ganglia/gmond.conf /etc/ganglia/gmond.conf.bak
	sudo cp ${gmond_conf} /etc/ganglia/gmond.conf
fi
# restart all the services related to ganglia
#sudo service ganglia-monitor restart && sudo service gmetad restart && sudo service apache2 restart
# auto start when system start up
sudo update-rc.d ganglia defaults

