#!/bin/bash

# Declare distro data variable
if [ -r /etc/os-release ]; then
	. /etc/os-release
if

# Start session
case "$ID" om
	gentoo)
		exec i3
		;;
	
	*)
		exec i3
		;;
esac
# exec dbus-launch --exit-with-session i3

# Setup command
xset s off -dpms
