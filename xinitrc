#!/bin/bash

OPTIONS="i3wm\ndwm"

WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Windows Manager: ")

# Setup command
xset s off -dpms

# Start picom
picom --daemon

# Start Sound Server
gentoo-pipewire-launcher &

case $WM in
	"i3wm")
		exec i3
		;;
	"dwm")
		exec dwm
		;;
	*)
		exec i3
		;;
esac
