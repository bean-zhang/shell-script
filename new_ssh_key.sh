#!/bin/bash
#
#

ssh-keygen -t rsa -b 4096

ssh_dir=~/.ssh
authorized_keys=~/.ssh/authorized_keys

if [ ! -d "${ssh_dir}" ]
then
	mkdir $ssh_dir
	chmod 700 $ssh_dir
fi

if [ ! -f "${authorized_keys}" ]
then
	touch $authorized_keys
	chmod 600 $authorized_keys
fi

