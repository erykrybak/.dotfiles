#!/bin/bash

# Check if a window ID is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <window_id>"
    exit 1
fi

WINDOW_ID="$1"

# Get the current active window ID
ACTIVE_WINDOW_ID=$(xdotool getactivewindow)

# Check if the provided window ID is focused
if [ "$WINDOW_ID" == "$ACTIVE_WINDOW_ID" ]; then
    # Minimize the window if it is focused
    wmctrl -r ":ACTIVE:" -b add,hidden
else
    # Focus the window if it is not focused
    wmctrl -ia "$WINDOW_ID"
fi
