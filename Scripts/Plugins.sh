#!/bin/bash

#echo 'src-git mo_small https://github.com/kenzok8/small-package' >>feeds.conf.default
echo 'src-git mo_small https://github.com/kiddin9/openwrt-packages' >> feeds.conf.default
echo "COMMIT_HASH=$(git rev-parse HEAD)" >> $GITHUB_ENV
        
rm -rf feeds/luci/modules/luci-base
rm -rf feeds/luci/modules/luci-mod-status
rm -rf feeds/packages/utils/coremark
rm -rf package/emortal/default-settings
        
svn export https://github.com/immortalwrt/luci/branches/master/modules/luci-base feeds/luci/modules/luci-base
svn export https://github.com/immortalwrt/luci/branches/master/modules/luci-mod-status feeds/luci/modules/luci-mod-status
svn export https://github.com/immortalwrt/packages/branches/master/utils/coremark package/new/coremark
svn export https://github.com/immortalwrt/immortalwrt/branches/master/package/emortal/default-settings package/emortal/default-settings        
        
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