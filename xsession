#!/bin/bash

# COLORS
#
#
FOREGROUND='#DCDCDC'
export FOREGROUND
BACKGROUND='#005577'
export BACKGROUND

# FONT
#
#
FONT='-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*'
export FONT

# INITIALIZATION
#
#
#setxkbmap -option terminate:ctrl_alt_bksp &
xscreensaver -no-splash &
(sleep 10s && conky | dzen2 -ta r -h 18 -x 1030 -tw 540  -e '' -fg $FOREGROUND -bg $BACKGROUND -fn $FONT -p ) &
exec ck-launch-session /usr/local/bin/dwm
