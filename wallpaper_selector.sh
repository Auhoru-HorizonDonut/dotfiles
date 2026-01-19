#!/bin/bash

shopt -s nullglob

wallpaper_list=(~/pic/wallpaper/desktop_wallpaper/*)
number_of_wallpaper=${#wallpaper_list[@]}

current_time=$(date +%s%3N)
index_value=$(( (current_time % number_of_wallpaper) - 1))

echo "Set wallpaper to ${wallpaper_list[$index_value]}"
ln -sf ${wallpaper_list[$index_value]} ~/pic/wallpaper/main_desktop_wallpaper
