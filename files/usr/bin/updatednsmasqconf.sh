#!/bin/sh

adblock() {
        wget -4 --no-check-certificate -O - https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt |
        grep ^\|\|[^\*/]*\^$ |
        sed -e 's:||:address\=\/:' -e 's:\^:/0\.0\.0\.0:' | uniq > /etc/dnsmasq.d/adblock.conf
        echo "$(date): update /etc/dnsmasq.d/adblock.conf from https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt">>/tmp/log/dnsmasq-config-update.log

        wget -4 --no-check-certificate -O - https://raw.githubusercontent.com/kcschan/AdditionalAdblock/master/list.txt |
        grep ^\|\|[^\*/]*\^$ |
        sed -e 's:||:address\=\/:' -e 's:\^:/0\.0\.0\.0:' >> /etc/dnsmasq.d/adblock.conf
        echo "$(date): update /etc/dnsmasq.d/adblock.conf from https://raw.githubusercontent.com/kcschan/AdditionalAdblock/master/list.txt">>/tmp/log/dnsmasq-config-update.log
}

gfwlist() {
        python /usr/bin/gfwlist2dnsmasq.py
        echo "$(date): update /etc/dnsmasq.d/dnsmasq_gfwlist.conf">>/tmp/log/dnsmasq-config-update.log
}

adblock
gfwlist

/etc/init.d/dnsmasq restart
echo "$(date): /etc/init.d/dnsmasq restart">>/tmp/log/dnsmasq-config-update.log
