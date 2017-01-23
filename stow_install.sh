#!/usr/bin/env bash

echo -e "\e[38;5;226mInstalling dotfiles...\e[0m"

declare -a pkgs=(
    'aria2'
    'bin'
    'compton'
    'dunst'
    'gem'
    'git'
    'gtk'
    'i3'
    'idl'
    # 'mpd'
    # 'ncmpcpp'
    'npm'
    'ssh'
    'termite'
    'tmux'
    'vim'
    'x'
    'zsh'
)

for dir in "${pkgs[@]}"
do
    echo -e "\e[38;5;164m==>\e[0m \e[38;5;85mstowing $dir ...\e[0m"
    stow -R $dir --ignore='^\.directory'
done

echo -e "\e[38;5;226mStow finished!\e[0m"
