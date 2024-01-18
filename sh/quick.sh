#!/bin/bash

echo "COMMIT_HASH=$(git rev-parse HEAD)" >> $GITHUB_ENV

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

# 添加额外插件
git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan
git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata

git_sparse_clone main https://github.com/kenzok8/small-package luci-app-filebrowser
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-ssr-mudb-server
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-eqos
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-ramfree
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-kodexplorer
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-xlnetacc
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-pushbot
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-wrtbwmon
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-unblockmusic
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-unblockneteasemusic
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-vlmcsd
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-zerotier
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-xunlei
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-adbyby-plus
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-n2n
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-qbittorrent
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-homebox
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-turboacc
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-usb-printer
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-vsftpd
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-easymesh

# 科学上网插件
git clone --depth=1 https://github.com/immortalwrt/homeproxy package/luci-app-homeproxy
git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-bypass

# 科学上网插件依赖
git_sparse_clone main https://github.com/kenzok8/small-package v2dat
git_sparse_clone main https://github.com/kenzok8/small-package lua-maxminddb
git_sparse_clone main https://github.com/kenzok8/small-package brook
git_sparse_clone main https://github.com/kenzok8/small-package trojan-go
git_sparse_clone main https://github.com/kenzok8/small-package trojan-plus
git_sparse_clone main https://github.com/kenzok8/small-package sagernet-core
git_sparse_clone main https://github.com/kenzok8/small-package lua-neturl
git_sparse_clone main https://github.com/kenzok8/small-package redsocks2
git_sparse_clone main https://github.com/kenzok8/small-package aria2
git_sparse_clone main https://github.com/kenzok8/small-package ariang
git_sparse_clone main https://github.com/kenzok8/small-package filebrowser
git_sparse_clone master https://github.com/kiddin9/openwrt-packages vlmcsd
git_sparse_clone master https://github.com/kiddin9/openwrt-packages sing-box
git_sparse_clone master https://github.com/kiddin9/openwrt-packages UnblockNeteaseMusic-Go
git_sparse_clone master https://github.com/kiddin9/openwrt-packages UnblockNeteaseMusic
git_sparse_clone master https://github.com/kiddin9/openwrt-packages wrtbwmon
git_sparse_clone master https://github.com/kiddin9/openwrt-packages homebox
git_sparse_clone master https://github.com/kiddin9/openwrt-packages vsftpd-alt
git_sparse_clone master https://github.com/kiddin9/openwrt-packages ddns-scripts
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qBittorrent-Enhanced-Edition
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qBittorrent-static
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qBittorrent
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qt6base
git_sparse_clone master https://github.com/kiddin9/openwrt-packages qt6tools
git_sparse_clone master https://github.com/kiddin9/openwrt-packages n2n
git_sparse_clone master https://github.com/kiddin9/openwrt-packages adbyby
git_sparse_clone master https://github.com/kiddin9/openwrt-packages dns-forwarder
git_sparse_clone master https://github.com/kiddin9/openwrt-packages upx-static
git_sparse_clone master https://github.com/kiddin9/openwrt-packages upx

# Themes
git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
git_sparse_clone main https://github.com/kenzok8/small-package luci-theme-ifit 
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom

# 晶晨宝盒
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-amlogic
#sed -i "s|firmware_repo.*|firmware_repo 'https://github.com/ophub/luci-app-amlogic'|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|kernel_path.*|kernel_path 'https://github.com/ophub/kernel'|g" package/luci-app-amlogic/root/etc/config/amlogic
#sed -i "s|ARMv8|ARMv8_PLUS|g" package/luci-app-amlogic/root/etc/config/amlogic

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
#git_sparse_clone main https://github.com/kenzok8/small-package luci-app-alist
#git_sparse_clone main https://github.com/kenzok8/small-package alist
git clone --depth=1 https://github.com/sbwml/luci-app-alist package/luci-app-alist

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

# 修改 Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

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
