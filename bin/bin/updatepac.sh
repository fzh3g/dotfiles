#!/bin/bash

# GFWLIST=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
PROXY=10.42.0.1:8118

cd ~/src
# echo "Downloading gfwlist from $GFWLIST"
# curl "$GFWLIST" > /tmp/gfwlist.txt

# gfwlist2pac \
#     -i /tmp/gfwlist.txt \
#     -f proxy.pac \
#     -p "PROXY $PROXY"

# rm -f /tmp/gfwlist.txt
genpac -p "PROXY $PROXY" > proxy.pac
sudo mv proxy.pac /srv/http/proxy.pac
