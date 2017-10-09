alias em="emacsclient"
alias e="emacsclient -t"
alias ev="emacsclient -c -a emacs"
alias es="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"

alias v=vim
alias vi=vim
alias vs="SUDO_EDITOR=\"vim\" sudoedit"

alias pxc=proxychains

alias xo=xdg-open
alias sz="source $HOME/.zshrc"
alias lpo="l | peco"

alias down='aria2c --conf-path=$HOME/.aria2/aria2.conf'

alias pipup="pip freeze --user | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U --user"

alias cp='cp -Rv'

alias path="echo $PATH | sed 's/\:/\n/g' | sort"
