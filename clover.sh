#!/bin/bash

. build/envsetup.sh
echo "Success"

# Lunch
lunch clover_lavender-bp2a-userdebug
echo "============"
echo "Starting...."
echo "============"

echo "Build Started"

mka clover

# Display any error logs

echo "Here is your error"
cat out/error.log
