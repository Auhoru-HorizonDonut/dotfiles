#!/bin/bash

NOW=$(date +%Y-%b-%d_%H-%M-%S)
NAME="$HOME/pic/screenshots/screenshot_$NOW.png"

mkdir -p $(dir $NAME)

case $@ in
	0)
	# Full screen
	maim --format png > $NAME
	;;

	1)
	# Select region
	maim --format png --select > $NAME
	;;

	*)
	# Default to full screen
	maim --format png > $NAME
	;;
esac

xclip -selection clip -t image/png ~/pic/screenshots/screenshot_$NOW.png
