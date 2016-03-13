#!/bin/bash
#
# Install Git and git clone on Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
# Install Git
sudo apt-get install -y git
# git clone
git=~/git
if [ ! -d "${git}" ]
then
    mkdir ${git}
fi
cd ${git}

git config --global http.proxy http://proxy.example.com:port
git config --global https.proxy https://proxy.example.com:port
git config --global url."https://".insteadOf git://

git clone https://github.com/87boy/dot-files.git
git clone https://github.com/87boy/shell-script.git

