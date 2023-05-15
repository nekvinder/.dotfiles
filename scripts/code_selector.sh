#!/usr/bin/bash

MyWorkDir="/home/nekvinder/wk"
MyConfigRoot="/home/nekvinder" # $(pwd)

selected=$(ls -t -d $MyWorkDir/*/ | tr '\n' '\0' | xargs -0 -n 1 basename | rofi -dmenu -p "Select a code dir" -config ~/.config/rofi/rofidmenu.rasi)
if [[ -z $selected  ]]; then
    echo "empty" >> /tmp/sad
else
    # code $MyWorkDir/$selected
    
    $MyConfigRoot/scripts/personal/runTmux.sh $MyWorkDir/$selected "$selected" >> /tmp/sad
    alacritty --working-directory="$MyWorkDir/$selected" --title="$selected : NVim" -e $SHELL -lc "tmux -u attach -t $selected"
fi
