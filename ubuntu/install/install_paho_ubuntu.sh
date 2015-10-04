#!/usr/bin/sh
#
# Install Paho on Ubuntu. The Paho project provides open-source client
# implementations of open and standard messaging protocols aimed at new,
# existing, and emerging applications for Machine-to-Machine(M2M) and Internet
# of Things(IoT).
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
apt-get update
apt-get upgrade -y

# Install pip
apt-get install python-pip
# Upgrade pip
pip install -U pip
# Install virtualenv
pip install virtualenv
# Make a directory
mkdir virtualenv
# Chang directory
cd virtualenv
# Create a new Python virtual environment
virtualenv rabbitmq
# Activate Python virtual environment
. ./rabbitmq/bin/activate
# Install Paho Library
pip install paho-mqtt

