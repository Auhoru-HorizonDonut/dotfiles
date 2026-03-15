#!/bin/bash

shopt -s nullglob

case $@ in
	0)
		command="feh --bg-fill" 
		wallpaper_list=($HOME/.wallpaper/*)
		;;
	1)
		command="i3lock -f -k -e -p win -i"
		wallpaper_list=($HOME/.wallpaper/*png)
		;;
	*)
		command="feh --bg-fill"
		wallpaper_list=($HOME/.wallpaper/*)
		;;
esac
number_of_wallpaper=${#wallpaper_list[@]}

current_time=$(date +%s%3N)
index_value=$(( (current_time % number_of_wallpaper) - 1))

echo "Set random wallpaper to ${wallpaper_list[$index_value]}"

$command ${wallpaper_list[$index_value]}
