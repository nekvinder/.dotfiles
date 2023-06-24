#!/usr/bin/bash

MyWorkDir="/home/nekvinder"
selected=$(ls -t -d $MyWorkDir/{personalProjects,wk}/*/ | tr '\n' '\0' | xargs -0 -n 1 basename | rofi -dmenu -p "Select a code dir" -config ~/.config/rofi/rofidmenu.rasi)

if [[ -z $selected  ]]; then
    echo "empty" >> /dev/null
else
    # runTmux has to be called with full path as it is not in PATH when called from i3
    if [ -d "$MyWorkDir/personalProjects/$selected" ]; then
        SelectedDirPath="$MyWorkDir/personalProjects/$selected"
    else
        SelectedDirPath="$MyWorkDir/wk/$selected"
    fi

    $HOME/.dotfiles/scripts/runTmux.sh $SelectedDirPath "$selected" >> /dev/null
    alacritty --working-directory="$SelectedDirPath" --title="$selected : NVim" -e $SHELL -lc "tmux -u attach -t $selected" >> /dev/null
fi
