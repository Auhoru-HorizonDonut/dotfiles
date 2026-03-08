#!/bin/bash

shopt -s nullglob

wallpaper_list=(~/pic/wallpaper/desktop_wallpaper/*)
number_of_wallpaper=${#wallpaper_list[@]}

current_time=$(date +%s%3N)
index_value=$(( (current_time % number_of_wallpaper) - 1))

echo "Set random wallpaper to ${wallpaper_list[$index_value]}"
ln -sf ${wallpaper_list[$index_value]} ~/pic/wallpaper/main_desktop_wallpaper

walldir=$(1:$HOME/pic/wallpaper/desktop_wallpaper)
PREVIEW=true rofi -no-config -theme fullscreen-preview.rasi -show filebrowser -filebrowser-command 'setbg' -filebrowser-directory "$walldir" -filebrowser-sorting-method mtime -selected-row 1 >/dev/null
#feh --bg-fill /home/horizon/pic/wallpaper/main_desktop_wallpaper
