#!/bin/bash

wmctrl -lp | while read -r line; do
    yuck=""
    win_id=$(echo "$line" | awk '{print $1}')
    app_pid=$(echo "$line" | awk '{print $3}')
    
    win_title=$(echo "$line" | awk '{$4=""; $3=""; print substr($0, index($0,$5))}')

    app_name=$(ps -p "$app_pid" -o comm=)

    yuck="${yuck}(button :text \"$win_title\")"
    echo "$yuck"
done
