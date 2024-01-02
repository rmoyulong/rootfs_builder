#!/bin/bash

# 移除要替换的包
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/net/msd_lite
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/themes/luci-theme-netgear
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-netdata
rm -rf feeds/luci/applications/luci-app-serverchan
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-homeproxy

# 添加额外插件
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan
git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
svn export https://github.com/kenzok8/small-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn export https://github.com/kenzok8/small-package/trunk/luci-app-ssr-mudb-server package/luci-app-ssr-mudb-server
svn export https://github.com/kenzok8/small-package/trunk/luci-app-eqos package/luci-app-eqos
svn export https://github.com/kenzok8/small-package/trunk/luci-app-easymesh package/luci-app-easymesh
svn export https://github.com/kenzok8/small-package/trunk/luci-app-ramfree package/luci-app-ramfree
svn export https://github.com/kenzok8/small-package/trunk/luci-app-kodexplorer package/luci-app-kodexplorer
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-wrtbwmon package/luci-app-wrtbwmon
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockmusic package/luci-app-unblockmusic
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/luci-app-vlmcsd
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-zerotier package/luci-app-zerotier
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-xunlei package/luci-app-xunlei

# 科学上网插件
git clone --depth=1 https://github.com/immortalwrt/homeproxy package/luci-app-homeproxy
git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
svn export https://github.com/haiibo/packages/trunk/luci-app-vssr package/luci-app-vssr
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass package/luci-app-bypass
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-passwall package/luci-app-passwall
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-passwall2 package/luci-app-passwall2
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
#svn export https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall package/luci-app-passwall
#svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2

# 科学上网插件依赖
svn co https://github.com/kenzok8/small-package/trunk/v2dat package/v2dat
svn co https://github.com/kenzok8/small-package/trunk/shadowsocks-libev package/shadowsocks-libev
svn co https://github.com/kenzok8/small-package/trunk/brook package/brook
svn co https://github.com/kenzok8/small-package/trunk/trojan-go package/trojan-go
svn co https://github.com/kenzok8/small-package/trunk/trojan-plus package/trojan-plus
svn co https://github.com/kenzok8/small-package/trunk/sagernet-core package/sagernet-core
svn co https://github.com/kenzok8/small-package/trunk/lua-neturl package/lua-neturl
svn co https://github.com/kenzok8/small-package/trunk/redsocks2 package/redsocks2
svn co https://github.com/kenzok8/small-package/trunk/aria2 package/aria2
svn co https://github.com/kenzok8/small-package/trunk/ariang package/ariang
svn co https://github.com/kenzok8/small-package/trunk/filebrowser package/filebrowser
svn co https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/vlmcsd
svn co https://github.com/kiddin9/openwrt-packages/trunk/sing-box package/sing-box
svn co https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic-Go package/UnblockNeteaseMusic-Go
svn co https://github.com/kiddin9/openwrt-packages/trunk/UnblockNeteaseMusic package/UnblockNeteaseMusic
svn co https://github.com/kiddin9/openwrt-packages/trunk/wrtbwmon package/wrtbwmon
# Themes
git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git clone --depth=1 https://github.com/Joecaicai/luci-theme-ifit package/luci-theme-ifit 
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
svn export https://github.com/haiibo/packages/trunk/luci-theme-atmaterial package/luci-theme-atmaterial
svn export https://github.com/haiibo/packages/trunk/luci-theme-opentomcat package/luci-theme-opentomcat
svn export https://github.com/haiibo/packages/trunk/luci-theme-netgear package/luci-theme-netgear

# 晶晨宝盒
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
#sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/haiibo/OpenWrt'|g" package/luci-app-amlogic/root/etc/config/amlogic
# sed -i "s|kernel_path.*|kernel_path 'https://github.com/ophub/kernel'|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|ARMv8|ARMv8_PLUS|g" package/luci-app-amlogic/root/etc/config/amlogic

# SmartDNS
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

# msd_lite
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite

# MosDNS
svn export https://github.com/kenzok8/small-package/trunk/luci-app-mosdns package/luci-app-mosdns
svn export https://github.com/kenzok8/small-package/trunk/mosdns package/mosdns

# DDNS.to
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto package/luci-app-ddnsto
svn export https://github.com/linkease/nas-packages/trunk/network/services/ddnsto package/ddnsto

# Alist
svn export https://github.com/sbwml/luci-app-alist/trunk/luci-app-alist package/luci-app-alist
svn export https://github.com/sbwml/luci-app-alist/trunk/alist package/alist

# iStore
svn export https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
svn export https://github.com/linkease/istore/trunk/luci package/luci-app-store

# 在线用户
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-onliner package/luci-app-onliner
#sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
#sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings
chmod 755 package/luci-app-onliner/root/usr/share/onliner/setnlbw.sh

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修复 hostapd 报错
#cp -f $GITHUB_WORKSPACE/scripts/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 取消主题默认设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

#Open Clash
cd ./package

git clone --depth=1 --single-branch --branch "dev" https://github.com/vernesong/OpenClash.git
#预置OpenClash内核和GEO数据
export CORE_VER=https://raw.githubusercontent.com/vernesong/OpenClash/core/dev/core_version
export CORE_TUN=https://github.com/vernesong/OpenClash/raw/core/dev/premium/clash-linux
export CORE_DEV=https://github.com/vernesong/OpenClash/raw/core/dev/dev/clash-linux
export CORE_MATE=https://github.com/vernesong/OpenClash/raw/core/dev/meta/clash-linux

export CORE_TYPE=$(echo $OWRT_TARGET | grep -Eiq "64|86" && echo "amd64" || echo "arm64")
export TUN_VER=$(curl -sfL $CORE_VER | sed -n "2{s/\r$//;p;q}")

export GEO_MMDB=https://github.com/alecthw/mmdb_china_ip_list/raw/release/lite/Country.mmdb
export GEO_SITE=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat
export GEO_IP=https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat

cd ./OpenClash/luci-app-openclash/root/etc/openclash

curl -sfL -o ./Country.mmdb $GEO_MMDB
curl -sfL -o ./GeoSite.dat $GEO_SITE
curl -sfL -o ./GeoIP.dat $GEO_IP

mkdir ./core && cd ./core

curl -sfL -o ./tun.gz "$CORE_TUN"-"$CORE_TYPE"-"$TUN_VER".gz
gzip -d ./tun.gz && mv ./tun ./clash_tun

curl -sfL -o ./meta.tar.gz "$CORE_MATE"-"$CORE_TYPE".tar.gz
tar -zxf ./meta.tar.gz && mv ./clash ./clash_meta

curl -sfL -o ./dev.tar.gz "$CORE_DEV"-"$CORE_TYPE".tar.gz
tar -zxf ./dev.tar.gz

chmod +x ./clash* ; rm -rf ./*.gz