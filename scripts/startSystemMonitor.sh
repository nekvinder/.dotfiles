#!/usr/bin/bash

currentWorkspace=$(i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2)

if [[ $(wmctrl -l | grep SystemMonitor) ]]; then 
    if [[ $currentWorkspace != 9 ]]; then
        i3-msg workspace 9
    fi
else
    alacritty --title="SystemMonitor" --class="SystemMonitor" -e $SHELL -lc "btop --utf-force" &
    if [[ $currentWorkspace != 9 ]]; then
        i3-msg workspace 9
    fi
fi
