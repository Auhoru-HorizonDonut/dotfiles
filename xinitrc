#!/bin/bash

OPTIONS="i3wm\ndwm\nxfce"

WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Windows Manager: ")

# Setup command
xset s off -dpms

# Start picom
picom --daemon

# Start Sound Server
gentoo-pipewire-launcher &

bg_changer

case $WM in
	"i3wm")
		exec i3
		;;
	"dwm")
		exec dwm
		;;
	"xfce")
		exec startxfce4
		;;
	*)
		exec i3
		;;
esac
