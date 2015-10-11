export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

plugins=(git archlinux colored-man zsh-syntax-highlighting tmux autojump)

export PATH=$HOME/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

# history
export HISTSIZE=2048
export SAVEHIST=2048
export HISTFILE=~/.history
setopt INC_APPEND_HISTORY
unsetopt EXTENDED_HISTORY

# path
export PATH=$PATH:$HOME/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin

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

alias pxc=proxychains

# http://superuser.com/questions/306028/tmux-and-zsh-custom-prompt-bug-with-window-name
DISABLE_AUTO_TITLE=true

# http://stackoverflow.com/questions/25094855/visible-ansi-escape-sequences-when-running-emacs-shell-these-are-not-ansi-color
if [[ -n $EMACS ]]; then
    export TERM=dumb
else
    export TERM=xterm-256color
fi

# http://stackoverflow.com/questions/11068965/how-can-i-make-tmux-be-active-whenever-i-start-a-new-shell-session
tmux attach &> /dev/null
if [[ !$TERM = xterm-256color ]]; then
    exec tmux
fi

# enhancd
if [ -f "/home/zhengfaxiang/.enhancd/zsh/enhancd.zsh" ]; then
    source "/home/zhengfaxiang/.enhancd/zsh/enhancd.zsh"
fi

# fasd
eval "$(fasd --init auto)"
