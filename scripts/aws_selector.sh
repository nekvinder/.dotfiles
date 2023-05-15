#!/usr/bin/bash

MyConfigRoot="/home/nekvinder" # $(pwd)
currentPath="$MyConfigRoot/scripts/wk"
dataselected=$(python3 "${currentPath}/wkScripts.py" openaws printlist)
selected=$(echo $dataselected | tr ' ' '\0' | xargs -0 -n 1 basename | rofi -dmenu -p "Select aws account")
if [[ -z $selected  ]]; then 
    echo "empty" >> /tmp/sad
else
    python3 "${currentPath}/wkScripts.py" openaws $selected >> /dev/null
fi
