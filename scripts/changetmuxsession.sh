#!/usr/bin/bash

tmux list-sessions -F '#{#{session_activity},#{session_name}}' |\
    sort -r |\
    sed '/^$/d' |\
    cut -d',' -f2- |\
    fzf --reverse --header jump-to-session --preview 'tmux capture-pane -pt {}'  |\
    xargs tmux switch-client -t
