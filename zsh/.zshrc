export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

plugins=(archlinux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# history
export HISTSIZE=2048
export SAVEHIST=2048
export HISTFILE=$HOME/.history
setopt INC_APPEND_HISTORY
unsetopt EXTENDED_HISTORY

# http://superuser.com/questions/306028/tmux-and-zsh-custom-prompt-bug-with-window-name
# DISABLE_AUTO_TITLE=true

# Path
export PATH=$PATH:$HOME/bin

# Go
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Ruby gem
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export GEM_PATH=$GEM_HOME
export PATH=$PATH:$GEM_HOME/bin

# node.js
export PATH=$PATH:$HOME/.node_modules/bin
export npm_config_prefix=$HOME/.node_modules

# hunspell dict
export DICPATH=$HOME/.hunspell

# emacs
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"

# alias
alias e="emacsclient -t"
alias es="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
alias ev="emacsclient -c -a emacs"

alias v=vim
alias vi=vim

alias gedit="kate"

alias pxc=proxychains

alias xo=xdg-open
alias sz="source $HOME/.zshrc"
alias lpo="l | peco"

alias down='aria2c --conf-path=$HOME/.aria2/aria2.conf'

export TERM=xterm-256color

# http://stackoverflow.com/questions/11068965/how-can-i-make-tmux-be-active-whenever-i-start-a-new-shell-session
tmux attach &> /dev/null
if [[ !$TERM = xterm-256color ]]; then
    exec tmux
fi

# enhancd
if [ -f "$HOME/.enhancd/zsh/enhancd.zsh" ]; then
    export ENHANCD_COMMAND=ecd
    source "$HOME/.enhancd/zsh/enhancd.zsh"
fi

# fuck
eval $(thefuck --alias)
