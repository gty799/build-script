#!/bin/bash

echo "Build Started"

mka clover

# Display any error logs

echo "Here is your error"
cat out/error.log
