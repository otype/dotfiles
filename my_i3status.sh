#!/bin/sh
# shell script to prepend i3status with more stuff
i3status | while :
do
    read line
    echo "`readlink /usr/local/etc/openvpn/openvpn.conf | cut -d. -f1`->$line" || exit 1
done
