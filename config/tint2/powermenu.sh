#!/bin/bash

# Define the options with corresponding Nerd Font icons and descriptions
options=(
    "  Shutdown"
    "  Reboot"
    "  Suspend"
    "󰍃  Logout"
    "  Lock"
)

# Display the options using rofi in vertical layout with text prompt
chosen=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Power Menu" -theme-str 'listview { layout: vertical; }' -no-fixed-height -font "Fira Code Nerd Font 15" -padding 10)

case "$chosen" in
    "  Shutdown") systemctl poweroff ;;  # Shutdown
    "  Reboot") systemctl reboot ;;       # Reboot
    "  Suspend") i3lock && systemctl suspend ;;       # Suspend
    "󰍃  Logout") openbox --exit ;;          # Logout
    "  Lock") i3lock ;;                    # Lock
    *) exit 1 ;;
esac
