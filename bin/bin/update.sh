#!/usr/bin/env bash

echo -e "\e[38;5;226mStarting update...\e[0m"

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

# ruby gems
echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mUpdating Ruby gems\e[0m"
gem update
gem cleanup

echo -e "\e[38;5;226mUpdating finished!\e[0m"
