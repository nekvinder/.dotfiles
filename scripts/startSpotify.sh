#!/usr/bin/bash

currentWorkspace=$(i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2)

if [[ $(wmctrl -l | grep Spotify_TUI) ]]; then 
    if [[ $currentWorkspace != 6 ]]; then
        i3-msg workspace 6
    fi
else
    alacritty --title="Spotify_TUI" --class="Spotify_TUI" -e $SHELL -lc "spt" &
    if [[ $currentWorkspace != 6 ]]; then
        i3-msg workspace 6
    fi
fi
