#!/usr/bin/bash

WINDOW_EXISTS=$(wmctrl -l | grep 'https://chat.openai.com' | wc -l)
if [ $WINDOW_EXISTS -eq 0 ]; then
    echo "Window does not exist"
    firefox --class firefox --url 'https://chat.openai.com/chat'
fi
