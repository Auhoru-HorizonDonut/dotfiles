#!/bin/bash

shopt -s nullglob

wallpaper_list=($HOME/.wallpaper/*)
number_of_wallpaper=${#wallpaper_list[@]}

current_time=$(date +%s%3N)
index_value=$(( (current_time % number_of_wallpaper) - 1))

echo "Set random wallpaper to ${wallpaper_list[$index_value]}"

feh --bg-fill ${wallpaper_list[$index_value]}
