#!/bin/bash
#
# custom script when launch an instance in openstack
#
# author: Bean Zhang
# email: sjtuzb@gmail.com
#

passwd ubuntu<<EOF
#password
your_password
your_password
EOF

apt-get update
apt-get install -y git

mkdir git
cd git
git clone https://github.com/87boy/dot-files.git
git clone git@github.com:87boy/shell-script.git
`
