#!/bin/bash

echo "Build Started"
# Accounts
git config --global user.name "gty799"
git config --global user.email "tema.valkov@inbox.ru"

#linux-x86 remove
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16 --git-lfs
echo "========================="
echo "Repo init success Master"
echo "========================="

# Build Sync
/opt/crave/resync.sh
echo "=============================="
echo "Master the Sync is now Success"
echo "=============================="

# Sync Trees
git clone https://github.com/gty799/Aeonjxx-device_xiaomi_lavender-4.19.git device/xiaomi/lavender
git clone https://github.com/gty799/Aeonixx-vendor_xiaomi_lavender-4.19.git vendor/xiaomi/lavender
git clone https://github.com/pix106/android_kernel_xiaomi_southwest-4.19.git kernel/xiaomi/lavender

#keys 

# Setup the build environment 
. build/envsetup.sh
echo "Success"

# Lunch
lunch lineage_lavender-bp2a-user
echo "============"
echo "Starting...."
echo "============"

# Build
derpfest lavender

# Display any error logs

echo "Here is your error"
cat out/error.log
