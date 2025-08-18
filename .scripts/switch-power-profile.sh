#!/bin/bash

status=$(upower -i /org/freedesktop/UPower/devices/line_power_ADP1 | grep 'online' | awk '{print $2}')

if [[ "$status" == "yes" ]]; then
    powerprofilesctl set performance
else
    powerprofilesctl set power-saver
fi

