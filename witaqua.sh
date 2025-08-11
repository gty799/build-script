#!/bin/bash

echo "Build Started"


#linux-x86 remove
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/WitAqua/manifest.git -b 16 --git-lfs
echo "========================="
echo "Repo init success Master"
echo "========================="

# Build Sync
/opt/crave/resync.sh
repo sync
echo "=============================="
echo "Master the Sync is now Success"
echo "=============================="

# Sync Trees
rm -rf device/xiaomi/lavender
rm -rf vendor/xiaomi/lavender
rm -rf kernel/xiaomi/sdm660
rm -rf kernel/xiaomi/lavender
rm -rf hardware/xiaomi
rm -rf device/xiaomi/sdm660-common
rm -rf vendor/xiaomi/sdm660-common
rm -rf kernel/xiaomi
rm -rf packages/apps/ViPER4AndroidFX
rm -rf hardware/qcom-caf/sdm660/audio
rm -rf hardware/qcom-caf/sdm660/display
rm -rf packages/apps/prebuilt
echo "Succefull delete tree"

git clone https://github.com/gty799/android_device_xiaomi_lavender.git -b witaqua device/xiaomi/lavender
git clone https://github.com/gty799/android_vendor_xiaomi_lavender.git -b 16 vendor/xiaomi/lavender
git clone https://github.com/gty799/android_kernel_xiaomi_southwest-4.19.git -b main-dynamic kernel/xiaomi/sdm660
git clone https://github.com/gty799/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/gty799/android_device_xiaomi_sdm660-common.git -b witaqua device/xiaomi/sdm660-common
git clone https://github.com/gty799/android_vendor_xiaomi_sdm660-common.git -b 16 vendor/xiaomi/sdm660-common
git clone https://github.com/pix106/android_hardware_qcom-caf_audio.git -b lineage-22.2 hardware/qcom-caf/sdm660/audio
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git -b v4a packages/apps/ViPER4AndroidFX
git clone https://github.com/pix106/android_hardware_qcom-caf_display -b lineage-22.2-caf-sdm660 hardware/qcom-caf/sdm660/display
git clone https://github.com/Drpto/packages_apps_prebuilt-camera.git packages/apps/prebuilt
#keys a

# Setup the build environment 
. build/envsetup.sh
echo "Success"

# Lunch
breakfast lavender
echo "============"
echo "Starting...."
echo "============"

# Build
brunch lavender
