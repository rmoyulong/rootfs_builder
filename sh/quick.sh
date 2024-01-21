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
rm -rf feeds/package/luci-app-turboacc
rm -rf package/luci-app-turboacc

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

merge_package(){
    # 参数1是分支名,参数2是库地址,参数3是子路径。所有文件下载到openwrt/package/openwrt-packages路径。
    # 同一个仓库下载多个文件夹直接在后面跟文件名或路径，空格分开。
    trap 'rm -rf "$tmpdir"' EXIT
    branch=$1 curl=$2 && shift 2
    rootdir=$(pwd)
    localdir=package/openwrt-packages
    [ -d $localdir ] || mkdir -p $localdir
    tmpdir=$(mktemp -d) || exit 1
    git clone -b $branch --depth 1 --filter=blob:none --sparse $curl $tmpdir
    cd $tmpdir
    git sparse-checkout init --cone
    git sparse-checkout set $@
    mv -f $@ $rootdir/$localdir && cd $rootdir
}

# 添加额外插件
git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/openwrt-packages/luci-app-serverchan
git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/openwrt-packages/luci-app-adguardhome
git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/openwrt-packages/luci-app-ikoolproxy
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/openwrt-packages/luci-app-poweroff
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/openwrt-packages/OpenAppFilter
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/openwrt-packages/luci-app-netdata
merge_package master https://github.com/lisaac/luci-app-dockerman applications/luci-app-dockerman

merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-filebrowser
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-ssr-mudb-server
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-eqos
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-ramfree
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-kodexplorer
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-xlnetacc
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-pushbot
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/luci-app-qbittorrent
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-wrtbwmon
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-unblockmusic
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-unblockneteasemusic
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-vlmcsd
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-zerotier
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-xunlei
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-adbyby-plus
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-n2n
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-homebox
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-turboacc
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-usb-printer
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-vsftpd
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/luci-app-easymesh

# 科学上网插件
git clone --depth=1 https://github.com/immortalwrt/homeproxy package/openwrt-packages/luci-app-homeproxy
git clone --depth=1 -b master https://github.com/kenzok8/small package/openwrt-packages/small
#git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
merge_package master https://github.com/vernesong/OpenClash applications/luci-app-openclash


# 科学上网插件依赖
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/lua-maxminddb
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/sagernet-core
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/filebrowser
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/qBittorrent-Enhanced-Edition
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/qBittorrent-static
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/qBittorrent
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/qt6base
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/qtbase
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/qttools
merge_package main https://github.com/kenzok8/small-package package/openwrt-packages/rblibtorrent
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/vlmcsd
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/UnblockNeteaseMusic-Go
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/UnblockNeteaseMusic
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/wrtbwmon
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/homebox
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/vsftpd-alt
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/ddns-scripts
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/n2n
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/adbyby
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/dns-forwarder
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/upx
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/aria2
merge_package master https://github.com/kiddin9/openwrt-packages package/openwrt-packages/ariang

# Themes
merge_package master https://github.com/kenzok8/luci-theme-ifit luci-theme-ifit 
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config

# 晶晨宝盒
#git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-amlogic
git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
sed -i "/amlogic_firmware_repo/ { s|https://github.com/breakings/OpenWrt|https://github.com/rmoyulong/rootfs_builder|g }" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic
sed -i "s|ARMv8|4jarmv8|g" package/openwrt-packages/luci-app-amlogic/root/etc/config/amlogic

# SmartDNS
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

# msd_lite
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite

# MosDNS
#git_sparse_clone main https://github.com/kenzok8/small-package luci-app-mosdns
#git_sparse_clone main https://github.com/kenzok8/small-package mosdns
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# DDNS.to
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-ddnsto
git_sparse_clone main https://github.com/kenzok8/small-package ddnsto

# Alist
#git clone --depth=1 https://github.com/sbwml/luci-app-alist package/luci-app-alist

# iStore
git_sparse_clone main https://github.com/linkease/istore-ui app-store-ui
git_sparse_clone main https://github.com/linkease/istore luci

# 在线用户
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-onliner
#sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
#sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings
chmod 755 package/luci-app-onliner/root/usr/share/onliner/setnlbw.sh

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
