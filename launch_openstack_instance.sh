#!/bin/bash
#
# Launch OpenStack Instance
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
apt-get update
apt-get upgrade -y

# Install vim
apt-get install -y vim

# Install git
apt-get install -y git
# Config git colorful output
git config color.ui true

mkdir git
cd git
git clone https://github.com/87boy/dot-files.git
ln -s ~/git/dot-files/87boy.vimrc ~/.vimrc

git clone https://github.com/87boy/shell-script.git
cd shell-script
chmod +x install_lamp_ubuntu.sh

