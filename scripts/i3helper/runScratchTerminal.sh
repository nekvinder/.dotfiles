#!/usr/bin/bash

WINDOW_EXISTS=$(wmctrl -l | grep 'terminal-scratch' | wc -l)
if [ $WINDOW_EXISTS -eq 0 ]; then
    echo "terminal does not exist"
    alacritty --title "terminal-scratch"
fi