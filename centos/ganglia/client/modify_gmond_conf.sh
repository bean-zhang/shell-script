#!/bin/bash
#
#

service gmond stop

mv /etc/ganglia/gmond.conf /etc/ganglia/gmond.conf.backup

sed -e 's/send_metadata_interval = 0/send_metadata_interval = 60/g' -e 's/collect_every = [0-9]*/collect_every = 1/g' -e 's/time_threshold = [0-9]*/time_threshold = 1/g' /etc/ganglia/gmond.conf.backup > /etc/ganglia/gmond.conf

service gmond start

