# zprofile
[ -f ~/.zprofile ] && source ~/.zprofile

# Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# zsh plugins
plugins=(archlinux zsh-syntax-highlighting colored-man-pages)

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

# Miniconda
if [ -f ~/app/miniconda2/etc/profile.d/conda.sh ]; then
    source ~/app/miniconda2/etc/profile.d/conda.sh
fi

# node.js
export NPM_CONFIG_PREFIX=$HOME/.node_modules

# Ruby gem
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export GEM_PATH=$GEM_HOME

# GNU GLOBAL
export GTAGSLABLE=pygments
export GTAGSCONF=$HOME/.globalrc

# Enhancd
if [ -f "$HOME/.enhancd/init.sh" ]; then
    export ENHANCD_COMMAND=cd
    source "$HOME/.enhancd/init.sh"
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias
[ -f ~/.alias.zsh ] && source ~/.alias.zsh

# Misc
[ -f ~/.misc.zsh ] && source ~/.misc.zsh

# Local
[ -f ~/.local.zsh ] && source ~/.local.zsh

# starship zsh prompt theme
eval "$(starship init zsh)"
