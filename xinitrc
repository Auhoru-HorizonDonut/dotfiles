#!/bin/bash

startdwm()
{
	custom-status-monitor &
	exec dbus-launch --exit-with-session dwm
}

starti3wm()
{
	exec dbus-launch --exit-with-session i3
}

# Setup command
xset s off -dpms

# Start picom
picom --daemon

# Start Sound Server
gentoo-pipewire-launcher &

# Set keyboard layout
setxkbmap -layout us,th -option 'grp:alt_space_toggle'

# Set backgroud picture
bg_changer

OPTIONS="dwm\ni3wm"

WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Windows Manager: ")

case $WM in
	"i3wm")
		starti3wm
		;;
	"dwm")
		startdwm
		;;
	*)
		startdwm
		;;
esac
