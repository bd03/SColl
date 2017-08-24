#!/bin/sh -e

/usr/bin/xbindkeys -n -v &  > /dev/null 2>&1
export DEVICE=$(xinput | grep Logitech | sed 's/.*id=\([^ ]*\)\[.*/\1/') &
nohup xinput set-button-map $DEVICE 1 2 3 14 15 12 13 8 9 10 11 6 7 4 5 &

exit 0
