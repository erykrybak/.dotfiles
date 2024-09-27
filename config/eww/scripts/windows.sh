#!/bin/bash

get_window_info() {
    wmctrl -lp | awk '{win_id=$1; app_pid=$3; title=""; for (i=4; i<=NF; i++) title = title " " $i; print win_id, app_pid, title}'
}

update_eww_windows() {
    buttons=""
    exclude=("Eww - powermenu eww" "Eww - bar eww")
    exclude_pattern=$(IFS=\|; echo "${exclude[*]}")

    while IFS= read -r line; do
        win_id=$(echo "$line" | awk '{print $1}')
        app_pid=$(echo "$line" | awk '{print $2}')
        win_title=$(echo "$line" | awk '{$1=""; $2=""; print substr($0, index($0,$3))}' | sed 's/^fedora //')
        app_name=$(ps -p "$app_pid" -o comm=)
        full_window_name="$win_title $app_name"

        if [[ "$full_window_name" =~ $exclude_pattern ]]; then
            continue
        fi

        icon=""
        if [[ -f /usr/share/icons/Papirus/24x24/apps/${app_name}.svg ]]; then
            icon="(image :path \"/usr/share/icons/Papirus/24x24/apps/${app_name}.svg\")"
        elif [[ -n $(find /usr/share/icons/Papirus/24x24/apps/ -name "*${app_name}*.svg" -print -quit) ]]; then
            icon_path=$(find /usr/share/icons/Papirus/24x24/apps/ -name "*${app_name}*.svg" -print -quit)
            icon="(image :path \"$icon_path\")"
        elif [[ "$app_name" == "pool_workqueue_release" && "$win_title" == *"Discord"* ]]; then
            icon="(image :path \"/usr/share/icons/Papirus/24x24/apps/discord.svg\")"
        else
            icon="(image :path \"/usr/share/icons/Papirus/24x24/mimetypes/application-x-executable.svg\")"
        fi

        buttons+="(button :width 170 :class \"window-button\" :onclick \"bash ~/.config/eww/scripts/toggle_window.sh $win_id\" (box :valign \"fill\" :halign \"fill\" :space-evenly false :orientation \"h\" $icon (label :limit-width 15 :text \" $win_title\" :unindent \"false\")))"
    done < <(get_window_info)

    echo "$buttons"
}

previous_info=$(get_window_info)
PREVIOUS_LIST=$(echo "$previous_info" | awk '{print $1}')
PREVIOUS_TITLES=$(echo "$previous_info" | awk '{$1=""; $2=""; print substr($0, index($0,$3))}')

update_eww_windows

xprop -spy -root _NET_CLIENT_LIST_STACKING | while read -r _; do
    current_info=$(get_window_info)
    CURRENT_LIST=$(echo "$current_info" | awk '{print $1}')
    CURRENT_TITLES=$(echo "$current_info" | awk '{$1=""; $2=""; print substr($0, index($0,$3))}')

    if [[ "$CURRENT_LIST" != "$PREVIOUS_LIST" ]] || [[ "$CURRENT_TITLES" != "$PREVIOUS_TITLES" ]]; then
        update_eww_windows
        PREVIOUS_LIST="$CURRENT_LIST"
        PREVIOUS_TITLES="$CURRENT_TITLES"
    fi
done
