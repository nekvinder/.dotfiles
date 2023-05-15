#!/usr/bin/bash

recollq -b '"sonar.projectVersion=0.005"'

selected=$(ls -t -d $MyWorkDir/*/ | tr '\n' '\0' | xargs -0 -n 1 basename | rofi -dmenu -p "Select a code dir")
if [[ -z $selected  ]]; then 
    echo "empty" >> /tmp/sad
else
    $MyConfigRoot/scripts/personal/runTmux.sh $MyWorkDir/$selected "$selected" >> /tmp/sad
    alacritty --working-directory="$MyWorkDir/$selected" --title="$selected : NVim" -e $SHELL -lc "tmux attach -t $selected"
fi
