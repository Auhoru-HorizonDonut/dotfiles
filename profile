# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

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

# Add podman as container manager
if [ -z "$DBX_CONTAINER_MANAGER" ]; then
	export DBX_CONTAINER_MANAGER=podman
fi

# Fetch system info
neofetch
