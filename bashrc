# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
# xset s off -dpms

# Set xdg runtime dir
if test -z "$XDG_RUNTIME_DIR"; then
	export $XDG_RUNTIME_DIR=$(mktemp -d /tmp/$(id -u)-runtime-dir.XXX)
fi

# Set bin path from user directory
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
	export PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"
fi

# Add webots path into PATH
if [ -z "$WEBOTS_HOME" ]; then
	export WEBOTS_HOME="$HOME/.local/webots"
fi

if [ -z "$DBX_CONTAINER_MANAGER" ]; then
	export DBX_CONTAINER_MANAGER=podman
fi

# if [ "$DBUS_SESSION_BUS_ADDRESS" != "unix:path=/run/user/1000/bus" ]; then
#	export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
# fi

# Print system info on start
neofetch
