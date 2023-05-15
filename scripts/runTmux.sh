#!/usr/bin/bash

TMUX_SESSION_ROOT=$1
TMUX_SESSION_NAME=$2
tmux has-session -t $TMUX_SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $TMUX_SESSION_NAME -c "$TMUX_SESSION_ROOT" >/dev/null
    tmux send-keys -t $TMUX_SESSION_NAME "nvim ." Enter
    
    # tmux new-window -t $TMUX_SESSION_NAME -n lazygit -c "$TMUX_SESSION_ROOT" "lazygit"
    
    # tmux new-window -t $TMUX_SESSION_NAME -n build -c "$TMUX_SESSION_ROOT"
    # tmux send-keys -t $TMUX_SESSION_NAME "yarnscripts" Enter
    
    tmux new-window -t $TMUX_SESSION_NAME -n wk -c "$TMUX_SESSION_ROOT"
    
    if [[ "$TMUX_SESSION_NAME" = "tf-aws-cloud" ]] || [[ "$TMUX_SESSION_NAME" = "tf-aws-cloud-i2" ]]; then
        tmux new-window -t $TMUX_SESSION_NAME -n aws_sandbox -c "$TMUX_SESSION_ROOT"
        tmux send-keys -t $TMUX_SESSION_NAME "export AWS_PROFILE=tf-sandbox-mfa" Enter "aws_mfa.sh tf-sandbox 123456"
    fi
    
fi

# tmux new-window -t $TMUX_SESSION_NAME -n vscode -c "$TMUX_SESSION_ROOT"
# tmux send-keys -t $TMUX_SESSION_NAME "code .; exit" Enter

tmux attach-session -t $TMUX_SESSION_NAME
