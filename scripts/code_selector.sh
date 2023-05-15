#!/usr/bin/bash

MyWorkDir="/home/nekvinder/wk"

selected=$(ls -t -d $MyWorkDir/*/ | tr '\n' '\0' | xargs -0 -n 1 basename | rofi -dmenu -p "Select a code dir" -config ~/.config/rofi/rofidmenu.rasi)
if [[ -z $selected  ]]; then
    echo "empty" >> /dev/null
else
    # runTmux has to be called with full path as it is not in PATH when called from i3
    $HOME/.dotfiles/scripts/runTmux.sh $MyWorkDir/$selected "$selected" >> /dev/null
    alacritty --working-directory="$MyWorkDir/$selected" --title="$selected : NVim" -e $SHELL -lc "tmux -u attach -t $selected" >> /dev/null
fi
