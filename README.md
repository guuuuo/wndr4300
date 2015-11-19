## 构建命令
- 清理
```
sudo make clean
```

- 构建简洁版固件，只添加：`luci`, `bootstrap主题`,`中文支持`
```
sudo make image PROFILE=WNDR4300 PACKAGES="luci luci-theme-bootstrap luci-i18n-base-zh-cn" FILES=files-clean/
```

- 构建带透明代理功能的固件，在简洁版的基础上，添加：`dnsmasq-full`, `shadowsocks`, `python`
```
sudo make image PROFILE=WNDR4300 PACKAGES="wget luci luci-theme-bootstrap luci-i18n-base-zh-cn iptables-mod-nat-extra ipset libopenssl shadowsocks-libev -dnsmasq dnsmasq-full python" FILES=files/
```

## 从已配置好的 `WNDR4300` 路由中备份配置文件
- 
```
scp root@192.168.1.1:/etc/config/firewall ./etc/config/
scp root@192.168.1.1:/etc/firewall.user ./etc/
scp root@192.168.1.1:/etc/config/luci ./etc/config/
scp root@192.168.1.1:/etc/config/network ./etc/config/
scp root@192.168.1.1:/etc/config/system ./etc/config/
scp root@192.168.1.1:/etc/config/wireless ./etc/config/
scp root@192.168.1.1:/etc/rc.local ./etc/
```