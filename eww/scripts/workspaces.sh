#!/bin/bash
xprop -spy -root _NET_CURRENT_DESKTOP | while read -r; do
echo "$(xprop -root _NET_CURRENT_DESKTOP | awk '{print substr($0,length,1)}')"
done
