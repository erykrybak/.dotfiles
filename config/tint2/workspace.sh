#!/bin/bash
xprop -spy -root _NET_CURRENT_DESKTOP | while read -r; do
workspace=$(( $(xprop -root _NET_CURRENT_DESKTOP | awk '{print substr($0,length,1)}') ))

    case $workspace in
        0)
            echo "󰲠 󰄰 󰄰 󰄰"
            ;;
        1)
            echo "󰄰 󰲢 󰄰 󰄰"
            ;;
        2)
            echo "󰄰 󰄰 󰲤 󰄰"
            ;;
        3)
            echo "󰄰 󰄰 󰄰 󰲦"
            ;;
        *)
            echo ""
            ;;
    esac
done

