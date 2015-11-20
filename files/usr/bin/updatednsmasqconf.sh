#!/bin/sh

adblock() {
        wget -4 --no-check-certificate -O - https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt |
        grep ^\|\|[^\*/]*\^$ |
        sed -e 's:||:address\=\/:' -e 's:\^:/0\.0\.0\.0:' | uniq > /etc/dnsmasq.d/adblock.conf

        wget -4 --no-check-certificate -O - https://raw.githubusercontent.com/kcschan/AdditionalAdblock/master/list.txt |
        grep ^\|\|[^\*/]*\^$ |
        sed -e 's:||:address\=\/:' -e 's:\^:/0\.0\.0\.0:' >> /etc/dnsmasq.d/adblock.conf
}

gfwlist() {
        python /usr/bin/gfwlist2dnsmasq.py
        echo "$(date): update dnsmasq gfwlist...">>/tmp/log/dnsmasq-config-update.log
}

#adblock
gfwlist

/etc/init.d/dnsmasq restart
