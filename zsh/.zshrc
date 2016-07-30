export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

plugins=(archlinux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# history
export HISTSIZE=4096
export SAVEHIST=4096
export HISTFILE=$HOME/.history
setopt INC_APPEND_HISTORY
unsetopt EXTENDED_HISTORY

# Terminal
export TERM=xterm-256color

# Emacs
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
alias e="emacsclient"
alias em="emacsclient -t"
alias ev="emacsclient -c -a emacs"
alias es="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"

alias v=vim
alias vi=vim
alias vs="SUDO_EDITOR=\"vim\" sudoedit"

if [[ $(which kate > /dev/null 2>&1) -eq 0 ]]; then
    alias gedit="kate"
fi

alias pxc=proxychains

alias xo=xdg-open
alias sz="source $HOME/.zshrc"
alias lpo="l | peco"

alias down='aria2c --conf-path=$HOME/.aria2/aria2.conf'

alias pipup="pip freeze | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip install -U"

# enhancd
if [ -f "$HOME/.enhancd/init.sh" ]; then
    export ENHANCD_COMMAND=ecd
    source "$HOME/.enhancd/init.sh"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fortune and cowsay
if [[ $(which cowsay > /dev/null 2>&1) -eq 0 ]] &&
       [[ $(which fortune > /dev/null 2>&1) -eq 0 ]]; then
    fortune | cowsay
fi

# misc
[ -f ~/.misc.zsh ] && source ~/.misc.zsh
