#!/usr/bin/sh
#
# Install RabbitMQ on Debian / Ubuntu
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

cd ~
# Add APT repository
#deb http://www.rabbitmq.com/debian/ testing main
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo 'deb http://www.rabbitmq.com/debian/ testing main' >> /etc/apt/sources.list

# Add public key to trusted key list
wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc

# update the package lists from the repositories
apt-get update

# Install packages as usual
apt-get install rabbitmq-server

# Make sure the following ports opened
# 4369(epmd), 25672(Erlang distribution)
# 5672,5671 (AMQP 0-9-1 without and with TLS)
# 15672 (if management plugin is enabled)
# 61613, 61614 (if STOMP is enabled)
# 1883, 8883 (if MQTT is enabled)

# Start RabbitMQ server
service rabbitmq-server start

# 
#GUEST_PASSWORD = $1
# Change the default password, guest of the default user, guest
#sudo rabbitmqctl change_password guest GUEST_PASSWORD

# Copy and unzip rabbitmq.config.example.gz
cp /usr/share/doc/rabbitmq-server/rabbitmq.config.example.gz /etc/rabbitmq/
gunzip /etc/rabbitmq/rabbitmq.config.example.gz
cp /etc/rabbitmq/rabbitmq.config.example /etc/rabbitmq/rabbitmq.config

# Enable rabbitmq_management, one of RabbitMQ plugins
rabbitmq-plugins enable rabbitmq_management
# Enable rabbitmq_mqtt, one of RabbitMQ plugins
rabbitmq-plugins enable rabbitmq_mqtt

# Delete default user, guest
rabbitmqctl delete_user guest
# Set username and password of a new user
ADMIN_USERNAME=$1
ADMIN_PASSWORD=$2
# Add new user
rabbitmqctl add_user $ADMIN_USERNAME $ADMIN_PASSWORD
# Set new user the tag, administrator
rabbitmqctl set_user_tags $ADMIN_USERNAME administrator

# Delete default vhost
rabbitmqctl delete_vhost /
# Add new vhost
NEW_VHOST=$3
rabbitmqctl add_vhost $NEW_VHOST
# Set permissions
rabbitmqctl set_persmissions -p $NEW_VHOST $ADMIN_USERNAME ".*" ".*" ".*"


