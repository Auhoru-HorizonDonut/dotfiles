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

setupmonitor()
{
	xrandr --output eDP-1 --auto
	if xrandr | grep "HDMI-1 connected"; then
		xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1
		xrandr --output HDMI-1 --primary
	else
		xrandr --output eDP-1 --primary
		xrandr --output HDMI-1 --auto
	fi
}

preflightstartup()
{
	# Setup command
	xset s off -dpms
	
	# Start picom
	picom --daemon
	
	# Start Sound Server
	gentoo-pipewire-launcher restart &
	
	# Set keyboard layout
	#setxkbmap -layout us,th -option 'grp:alt_space_toggle'
	
}

# Setup multi-monitor (if available)
setupmonitor

# Set backgroud picture
bg_changer

OPTIONS="dwm\ni3wm"
WM=$(echo -e "$OPTIONS" | rofi -show -dmenu -i -p "Select Windows Manager: ")

# Run wm related system start up
preflightstartup

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
