#!/bin/sh

echo "Installing dotfiles..."

DIR=(~/dotfiles/*/)

declare -a pkgs=(
    'bin'
    'compton'
    'git'
    'gtk'
    'i3'
    'mpd'
    'ncmpcpp'
    'tmux'
    'x'
    'zsh'
)

for dir in "${pkgs[@]}"
do
    if [ $dir != images ]; then {
        echo -e "\e[1;36m==>\e[0m \e[1;31mstowing $dir\e[0m"
        stow -R $dir
    }
    fi
done

echo -e "\e[3;93mStow finished! Enjoy your journey!\e[0m"
       
