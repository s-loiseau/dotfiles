#!/usr/bin/env bash
#setxkbmap -layout us_qwerty-fr
#setxkbmap -layout ca -variant multi -option "ctrl:nocaps"
export DISPLAY=:0
# FIX FOR DBUS AND DUNST
systemctl --user import-environment DISPLAY


# FOR MULTIPLE KEYBOARDS eg. external usbkey use `xinput | grep -i keyboard`
#setxkbmap -layout us-qwerty-fr,ca -variant ,multi -option "ctrl:nocaps" -option "grp:win_space_toggle"
setxkbmap -layout us,ca -variant ,multi -option "ctrl:nocaps" -option "grp:win_space_toggle"
#setxkbmap -device 15 -layout us,ca -variant ,multi -option "ctrl:nocaps" -option "grp:win_space_toggle"
#setxkbmap -device 12 -layout us,ca -variant ,multi -option "ctrl:nocaps" -option "grp:win_space_toggle"
xrdb .Xresources
xreload
exec i3

#openbox
