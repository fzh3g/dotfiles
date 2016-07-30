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
