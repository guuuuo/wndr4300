#!/bin/sh
python /usr/bin/gfwlist2dnsmasq.py 
echo "$(date): update dnsmasq config ...">>/tmp/log/dnsmasq-config-update.log
