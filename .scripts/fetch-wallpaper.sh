#!/bin/bash

RAW_PATH=$(grep "^wallpaper" ~/.config/waypaper/config.ini | cut -d '=' -f2- | xargs)
WALLPAPER=$(eval echo "$RAW_PATH")

if [ ! -f "$WALLPAPER" ]; then
    echo "Wallpaper file not found: $WALLPAPER"
    exit 1
fi

ln -sf "$WALLPAPER" ~/.config/waypaper/current_wallpaper

"$(~/.scripts/apply-wallpaper-colors.sh)"