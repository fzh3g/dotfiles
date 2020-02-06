# zprofile
[ -f ~/.zprofile ] && source ~/.zprofile

# Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# zsh prompt theme
ZSH_THEME="spaceship"

# Just comment a section if you want to disable it
SPACESHIP_PROMPT_ORDER=(
  # time        # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg          # Mercurial section (hg_branch  + hg_status)
  # package     # Package version
  # node        # Node.js section
  # ruby        # Ruby section
  # elixir      # Elixir section
  # xcode       # Xcode section
  # swift       # Swift section
  # golang      # Go section
  # php         # PHP section
  # rust        # Rust section
  # haskell     # Haskell Stack section
  # julia       # Julia section
  # docker      # Docker section
  # aws         # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet      # .NET section
  # ember       # Ember.js section
  # kubecontext # Kubectl context section
  # terraform   # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  # battery     # Battery level and status
  # vi_mode     # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

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
