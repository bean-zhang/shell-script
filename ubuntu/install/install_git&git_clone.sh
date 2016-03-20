#!/bin/bash
#
# Install Git and git clone on Ubuntu
#
# author: Bean Zhang
# email: sjtuzb@gmail.com
#

cd ~
# Install Git
sudo apt-get install -y git
# git clone
cd ~/git
git clone https://github.com/87boy/dot-files.git
git clone https://github.com/87boy/shell-script.git

