#!/bin/bash

battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)

case $battery_capacity in
    [9][0-9]|100)
        echo ""
        ;;
    [6-8][0-9])
        echo ""
        ;;
    [3-5][0-9])
        echo ""
        ;;
    [2][1-9])
        echo ""
        ;;
    [1-9])
        echo ""
        ;;
    *)
        echo "Unable to determine battery status."
        ;;
esac

