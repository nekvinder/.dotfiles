TMUX_SESSION_NAME='smartScripts'
tmux new-session -d -s $TMUX_SESSION_NAME >/dev/null
tmux new-window -t $TMUX_SESSION_NAME
tmux send-keys -t $TMUX_SESSION_NAME "$1" Enter