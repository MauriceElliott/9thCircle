#! /bin/sh
set -e
echo "debug1"
cleanup() {
    osascript -e 'quit app "Playdate Simulator"' 2>/dev/null
}

echo "debug2"
trap cleanup EXIT

cd ..
swift package pdc

echo "debug3"
# Create a symbolic link to the compiled pdx in the Playdate Simulator Games dir
# This allows browsing the pdx as a sideloaded game, helpful for checking icons
if [ -e ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx ]
then
    rm -rf ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx
fi
ln -s "$(pwd)/.build/plugins/PDCPlugin/outputs/$CONFIGURATION/$PRODUCT_NAME.pdx" ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx

echo "debug4"

~/Developer/PlaydateSDK/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx
