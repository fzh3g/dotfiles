#!/bin/sh

echo "Installing dotfiles..."

declare -a pkgs=(
    'aria2'
    'bin'
    'compton'
    'git'
    'gtk'
    'i3'
    'mpd'
    'ncmpcpp'
    'redshift'
    'ssh'
    'terminator'
    'tmux'
    'vim'
    'x'
    'zsh'
)

for dir in "${pkgs[@]}"
do
    echo -e "\e[1;36m==>\e[0m \e[1;31mstowing $dir\e[0m"
    stow -R $dir
done

echo -e "\e[3;93mStow finished! Enjoy your journey!\e[0m"

