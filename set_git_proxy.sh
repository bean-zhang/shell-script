#!/bin/bash
#
# Set git proxy
#

git config --global http.proxy http://<proxy_user>:<proxy_password>@proxy.server.com:<port>
git config --global https.proxy https://<proxy_user>:<proxy_password>@proxy.server.com:<port>
git config --global url."https://".insteadOf git://

#git config --system

