#!/bin/bash
#
# Set the proxy. Put this file in /etc/profile.d/
#
# author: Bin Zhang
# email: sjtuzb@gmail.com
#

export http_proxy=http://proxy.example.com:port/
export https_proxy=https://proxy.example.com:port/
export ftp_proxy=ftp://proxy.example.com:port/
export rsync_proxy=$http_proxy
export no_proxy="127.0.0.1,localhost,local_address,local_domain.com"
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export FTP_PROXY=$ftp_proxy
export RSYNC_PROXY=$http_proxy
export NO_PROXY=$no_proxy

