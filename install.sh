
# Install stow


stow bash
stow fonts
stow git
stow misc
stow nvim
stow tmux
stow zsh

# Install nvim needed plugins
npm install -g fixjson
nvim +PlugInstall +qall
