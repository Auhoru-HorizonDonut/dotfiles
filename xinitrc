#!/bin/bash

OPTIONS="i3wm\ndwm"

WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Windows Manager: ")

case $WM in
	"i3wm")
		exec dbus-launch --exit-with-session i3
		;;
	"dwm")
		exec dwm
		;;
	*)
		exec i3
		;;
esac

# Setup command
xset s off -dpms
