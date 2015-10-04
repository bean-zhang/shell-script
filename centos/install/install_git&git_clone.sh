#!/bin/bash
#
# Install Git and git clone on CentOS
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#
cd ~
# Install Ganglia Monitor
yum install -y git
# git clone
cd ~/git
git clone https://github.com/87boy/dot-files.git
git clone https://github.com/87boy/shell-script.git

