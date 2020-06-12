#!/usr/bin/env bash

echo -e "\e[38;5;226mInstalling dotfiles...\e[0m"

declare -a pkgs=(
    'bin'
    # 'compton'
    'ctags'
    # 'dunst'
    'fontconfig'
    # 'gem'
    'git'
    # 'i3'
    # 'idl'
    'libinput-gestures'
    # 'mpd'
    # 'npm'
    'pip'
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
