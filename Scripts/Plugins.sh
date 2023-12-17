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

#echo 'src-git kenzo8 https://github.com/kenzok8/small-package' >> feeds.conf.default
#svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-unblockmusic package/luci-app-unblockmusic
#svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/luci-app-vlmcsd
#svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-zerotier package/luci-app-zerotier
#svn co https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/vlmcsd

echo 'src-git kenzo8 https://github.com/kiddin9/openwrt-packages' >> feeds.conf.default
git clone --depth=1 https://github.com/Joecaicai/luci-theme-ifit package/luci-theme-ifit 
echo "COMMIT_HASH=$(git rev-parse HEAD)" >> $GITHUB_ENV
        
#mv $GITHUB_WORKSPACE/path/0001-ipq807x-add-stock-layout-variant-for-redmi-ax6.patch 0001-ipq807x-add-stock-layout-variant-for-redmi-ax6.patch
#git apply 0001-ipq807x-add-stock-layout-variant-for-redmi-ax6.patch
        
chmod +x $GITHUB_WORKSPACE/path/*.sh
chmod -Rf 777 $GITHUB_WORKSPACE/path/*
chmod -Rf 777 $GITHUB_WORKSPACE/path/*.*
mv $GITHUB_WORKSPACE/path/01_leds target/linux/qualcommax/ipq807x/base-files/etc/board.d/01_leds
mv $GITHUB_WORKSPACE/path/02_network target/linux/qualcommax/ipq807x/base-files/etc/board.d/02_network
mv $GITHUB_WORKSPACE/path/11-ath10k-caldata target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath10k-caldata
mv $GITHUB_WORKSPACE/path/11-ath11k-caldata target/linux/qualcommax/ipq807x/base-files/etc/hotplug.d/firmware/11-ath11k-caldata
mv $GITHUB_WORKSPACE/path/bootcount target/linux/qualcommax/ipq807x/base-files/etc/init.d/bootcount
mv $GITHUB_WORKSPACE/path/platform.sh target/linux/qualcommax/ipq807x/base-files/lib/upgrade/platform.sh
mv $GITHUB_WORKSPACE/path/ipq807x.mk target/linux/qualcommax/image/ipq807x.mk 
mv $GITHUB_WORKSPACE/path/ipq8071-ax6-stock.dts target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax6-stock.dts
mv $GITHUB_WORKSPACE/path/ipq8071-ax3600-stock.dts target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq8071-ax3600-stock.dts