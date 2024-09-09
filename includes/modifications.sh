#!/bin/bash
#

mkdir -p files/sbin
wget https://raw.githubusercontent.com/mstarczewski/OpenWRT_packages/master/sysinfo/files/sbin/sysinfo.sh -P files/sbin
chmod +x files/sbin/sysinfo.sh
wget https://raw.githubusercontent.com/mstarczewski/OpenWRT_packages/master/sysinfo/files/etc/profile.d/99-sysinfo.sh -P files/etc/profile.d
mkdir -p files/etc/uci-defaults
cat > files/etc/uci-defaults/xxx_config << EOF
uci set wireless.radio0.disabled=0
uci commit
/etc/init.d/acme disable
/etc/init.d/dnscrypt-proxy enable
/etc/init.d/dnscrypt-proxy restart
/etc/init.d/adblock restart
EOF
