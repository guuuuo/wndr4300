#!/bin/sh
python /usr/bin/gfwlist2dnsmasq.py 
echo "$(date): update dnsmasq gfwlist ...">>/tmp/log/dnsmasq-config-update.log
