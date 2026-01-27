
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
