#!/usr/local/bin/fish

set PRODUCT_NAME "ninthCircle"

function cleanup
    osascript -e 'quit app "Playdate Simulator"' ^/dev/null
end

# Register cleanup to run on script exit
function on_exit --on-event fish_exit
    cleanup
end

set SWIFT (xcrun -f swift -toolchain "swift latest")
cd ..
$SWIFT package pdc

# Create a symbolic link to the compiled pdx in the Playdate Simulator Games dir
set PDX_PATH (pwd)/.build/plugins/PDCPlugin/outputs/$PRODUCT_NAME.pdx
set LINK_PATH ~/Developer/PlaydateSDK/Disk/Games/$PRODUCT_NAME.pdx

if test -L $LINK_PATH
    rm -rf $LINK_PATH
end

echo $PDX_PATH

ln -s $PDX_PATH $LINK_PATH

~/Developer/PlaydateSDK/bin/Playdate\ Simulator.app/Contents/MacOS/Playdate\ Simulator $LINK_PATH
