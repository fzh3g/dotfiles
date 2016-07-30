export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

plugins=(archlinux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# History
export HISTSIZE=4096
export SAVEHIST=4096
export HISTFILE=$HOME/.history
setopt INC_APPEND_HISTORY
unsetopt EXTENDED_HISTORY

# Terminal
export TERM=xterm-256color

# Editor
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"

# Enhancd
if [ -f "$HOME/.enhancd/init.sh" ]; then
    export ENHANCD_COMMAND=ecd
    source "$HOME/.enhancd/init.sh"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fortune and cowsay
if [[ $(which cowsay > /dev/null 2>&1) -eq 0 ]] &&
       [[ $(which fortune > /dev/null 2>&1) -eq 0 ]]; then
    fortune | cowsay
fi

# Alias
[ -f ~/.alias.zsh ] && source ~/.alias.zsh

# Misc
[ -f ~/.misc.zsh ] && source ~/.misc.zsh
