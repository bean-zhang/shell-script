#!/bin/bash
#
# Set the proxies.
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#
sudo cp ~/git/proxy.sh /etc/profile.d/
sudo cp ~/git/95proxies /etc/apt/apt.conf.d/

source /etc/profile.d/proxy.sh

# Verify that apt has picked up these settings via this command
sudo apt-config dump  | grep -i proxy # lists the proxy settings

env | grep proxy

ssh_dir=~/.ssh
if [ ! -d "${ssh_dir}" ]
then
	mkdir -p ~/.ssh
fi
config_file=${ssh_dir}/config
if [ ! -f "${config_file}" ]
then
	touch ${config_file}
fi

echo "Host				git.coding.net" >> ${config_file}
echo "User				git" >> ${config_file}
echo "ProxyCommand		/bin/nc -X connect -x proxy_ip:proxy_port %h %p" >> ${config_file}


