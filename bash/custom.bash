alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias tmux='tmux -u'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export DP2="HDMI-1-1"
export DP1="eDP1"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.dotfiles/scripts:$PATH"
export PATH="$HOME/.dotfiles_private/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias pls='sudo $(fc -ln -1)'

alias cw="cd /home/nekvinder/wk"
alias c="clear"
alias t="tmux"
alias news="newsboat"
alias launchPolybar="launchPolybar.sh"
alias wk="wk.sh"
alias n="nvim"
alias cpb="git rev-parse --abbrev-ref HEAD | clipboard"
alias enabledocker="sudo chmod 666 /var/run/docker.sock"
alias lg="lazygit"
alias ld="lazydocker"
alias gp="git push"
alias ln="lazynpm"
alias cat="bat"
alias jv="clear; json-tui"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

function wks {
    wk help > /tmp/wkhelp.json
    selected=$(cat /tmp/wkhelp.json | jq '. | keys[]' | fzf --preview "cat /tmp/wkhelp.json | jq '.\"{}\"'")
    selected=$(echo $selected | tr -d '"')
    read -p "$selected? (YES/no) " yn
    case $yn in
        yes ) echo running $selected;;
        y ) echo running $selected;;
        no ) exit;;
        n ) exit;;
        * ) echo running $selected;;
    esac
    
    wk.sh "$selected"
}

function yarnscripts {
    cat package.json | jq '.scripts | keys[]' | fzf --preview "cat package.json | jq '.scripts.\"{}\"'" | xargs yarn
}
alias yarns="yarnscripts"

function catscripts {
    cat package.json | jq '.scripts'
}

function ins {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

function re {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}

function cdf {
    cd /
    FILENAMETMP=$(fzf)
    dirnameTmp=$(dirname "${FILENAMETMP}")
    cd $dirnameTmp
}

cheat() {
	local keyword=""
	keyword="${1}"
	[ -n "${keyword}" ] && curl cheat.sh/"${keyword}"
}

# function cd {
#     builtin cd "$@" && ls -a
# }

export PATH="$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH"
export PATH="/usr/local/share/nvim-linux64/bin:$PATH"
export PATH="/usr/local/bin/platform-tools:$PATH"

source /usr/share/nvm/init-nvm.sh
export EDITOR=nvim


alias dotconfig='cd ~/.dotfiles; nvim .'
alias dotconfigp='cd ~/.dotfiles_private; nvim .'
echo "dotconfig"

