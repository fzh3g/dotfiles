#!/usr/bin/env zsh

echo -e "\e[38;5;226mStarting update...\e[0m"

# pacman && yaourt
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating system packages...\e[0m"
sudo pacman -Syu
yaourt -Syu

# pip
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating Python packages...\e[0m"
pip freeze | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip install -U

# ruby gems
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating Ruby gems...\e[0m"
gem update
gem cleanup

# npm
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating npm...\e[0m"
npm -g update
npm ddp -g
cd ~/Web/blog/ && ncu -u && npm install && npm ddp

# oh-my-zsh
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating oh-my-zsh...\e[0m"
if [ ! -d ~/.oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    cd ~/.oh-my-zsh && git pull origin master
fi

# bullet-train theme
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating bullet-train-zsh-theme...\e[0m"
if [ -f ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme ]; then
    rm ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
fi
wget -P ~/.oh-my-zsh/custom/themes/ \
     http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme

# zsh-syntax-highlighting
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating zsh-syntax-highlighting...\e[0m"
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/ ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
else
    cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/ && \
        git pull origin master
fi

# enhancd
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating Enhancd...\e[0m"
if [ ! -d ~/.enhancd/ ]; then
    git clone https://github.com/b4b4r07/enhancd ~/.enhancd
else
    cd ~/.enhancd/ && git pull origin master
fi
source ~/.enhancd/init.sh

# fzf
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating fzf...\e[0m"
if [ ! -d ~/.fzf/ ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
else
    cd ~/.fzf/ && git pull origin master
fi
~/.fzf/install --all
rm ~/.bashrc ~/.fzf.bash

# IDL
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating IDL libraries...\e[0m"
cd ~/lib/idl/astrolib/ && git pull origin master
cd ~/lib/idl/idl-coyote/ && git pull origin master

# source .zshrc
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mSource ~/.zshrc\e[0m"
source ~/.zshrc

# finished!
echo -e "\e[38;5;226mUpdating finished!\e[0m"
