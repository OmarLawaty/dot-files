#!/bin/bash

choice=$(echo -e " Power Off\n Reboot\n Suspend\n󰗽 Logout\n Windows" | wofi -dmenu -i -p "Power Menu")

sh ~/.scripts/save-window-desktop.sh

case "$choice" in
    " Power Off") systemctl poweroff ;;
    " Reboot") systemctl reboot ;;
    " Suspend") systemctl suspend ;;
    "󰗽 Logout") hyprctl dispatch exit ;;
    " Windows") sudo ~/.scripts/reboot-windows.sh ;;
    *) exit 1 ;;
esac
