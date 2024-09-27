#!/bin/bash

if wmctrl -lp | grep -q "Eww - powermenu"; then
    ~/eww/target/release/eww close powermenu
else
    ~/eww/target/release/eww open powermenu
fi

