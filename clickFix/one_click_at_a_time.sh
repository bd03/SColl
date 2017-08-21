#!/bin/bash
# one_click_at_a_time.sh
# use in accompany with xbindkeys as described here:
# https://unix.stackexchange.com/questions/30401/is-there-a-way-to-control-the-mouse-wheel-resolution-in-debian


lock_loc=$HOME

if [ ! -f $lock_loc/click.lock ]; then
    # click
    lockfile $lock_loc/click.lock
    if [[ "$1" == "f" ]]; then
        # forward
        /usr/bin/xte 'keydown Alt_L' 'key Right' 'keyup Alt_L' &
    elif [[ "$1" == "b" ]]; then
        # back
        /usr/bin/xte 'keydown Alt_L' 'key Left' 'keyup Alt_L' &
    fi
    sleep 0.26
    rm -rf $lock_loc/click.lock
fi