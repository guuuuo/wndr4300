## 开启 WNDR4300 128M 内存
[参考这里](https://github.com/openwrt-mirror/openwrt/commit/1dbb652ea0594c284710ace5e479c1ac7fdd1cbb)，修改文件 **target/linux/ar71xx/image/Makefile**
```diff
- wndr4300_mtdlayout=mtdparts=ar934x-nfc:256k(u-boot)ro,256k(u-boot-env)ro,256k(caldata),512k(pot),2048k(language),512k(config),3072k(traffic_meter),2048k(kernel),23552k(ubi),25600k@0x6c0000(firmware),256k(caldata_backup),-(reserved)
+ wndr4300_mtdlayout=mtdparts=ar934x-nfc:256k(u-boot)ro,256k(u-boot-env)ro,256k(caldata),512k(pot),2048k(language),512k(config),3072k(traffic_meter),2048k(kernel),120832k(ubi),122880k@0x6c0000(firmware),256k(caldata_backup),-(reserved)
```

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
sudo make image PROFILE=WNDR4300 PACKAGES="wget luci luci-theme-bootstrap luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn iptables-mod-nat-extra ipset libopenssl shadowsocks-libev -dnsmasq dnsmasq-full python" FILES=files/
```

## 从已配置好的 `WNDR4300` 路由中备份配置文件
```
scp root@192.168.1.1:/etc/config/firewall ./etc/config/
scp root@192.168.1.1:/etc/firewall.user ./etc/
scp root@192.168.1.1:/etc/config/luci ./etc/config/
scp root@192.168.1.1:/etc/config/network ./etc/config/
scp root@192.168.1.1:/etc/config/system ./etc/config/
scp root@192.168.1.1:/etc/config/wireless ./etc/config/
scp root@192.168.1.1:/etc/rc.local ./etc/
```
