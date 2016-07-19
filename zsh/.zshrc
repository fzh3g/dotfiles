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

# Path
export PATH=$PATH:$HOME/bin

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

# Heasoft
# export HEADAS=/usr/local/heasoft-6.17/x86_64-unknown-linux-gnu-libc2.22
# alias heainit=". $HEADAS/headas-init.sh"

# XMM SAS
# alias sasinit=". /usr/local/SAS/xmmsas_20141104_1833/setsas.sh"

# CALDB
# export CALDB=$HOME/app/caldb
# export CALDBCONFIG=$CALDB/software/tools/caldb.config
# export CALDBALIAS=$CALDB/software/tools/alias_config.fits

# CIAO
# alias ciao="source $HOME/app/ciao-4.7/bin/ciao.bash"

# Miriad
alias miriadinit="source /usr/local/miriad/miriad_cvs/miriad_start.sh"

# GILDAS
export GAG_ROOT_DIR=$HOME/app/gildas-exe-apr16a
export GAG_EXEC_SYSTEM=x86_64-arch-gfortran
source $GAG_ROOT_DIR/etc/bash_profile

# KARMA
export KARMABASE=/usr/local/karma
export PATH=$PATH:$KARMABASE/bin

# CASA
export PATH=$PATH:$HOME/app/casa/bin

# alias
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
