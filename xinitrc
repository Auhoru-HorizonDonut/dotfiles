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

wmedselect()
{
	OPTIONS="dwm\ni3wm"
	WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Tiling Windows Manager or Desktop Environment: ")
	
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
}

setupmonitor()
{
	xrandr --output eDP-1 --auto
	if xrandr | grep "HDMI-1 connected"; then
		xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1 --primary
	else
		xrandr --output eDP-1 --primary --output HDMI-1 --auto
	fi
}

preflightstartup()
{
	# Setup command
	#xset s off -dpms
	
	# Start picom
	picom --daemon
	
	# Start Sound Server
	gentoo-pipewire-launcher restart &

	# Set FCITX evenironment variable
	export GTK_IM_MODULE=fcitx
	export QT_IM_MODULE=fcitx
	export XMODIFIERS=@im=fcitx
	
	# Start FCITX daemon
	fcitx5 -d --replace &
}

main()
{
	# Set up multi-monitor ( if available )
	setupmonitor

	# Set background
	bg_changer &

	# Run wm preflight start up
	preflightstartup

	# Currently default to dwm
	startdwm
}

main
#OPTIONS="dwm\ni3wm"
#WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Windows Manager: ")
#
#case $WM in
#	"i3wm")
#		starti3wm
#		;;
#	"dwm")
#		startdwm
#		;;
#	*)
#		startdwm
#		;;
#esac
