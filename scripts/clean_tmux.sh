tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}' | ifne xargs -n 1 tmux kill-session -t
