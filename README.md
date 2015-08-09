# Zhengfaxiang's ArchLinux Config Files #

## Introduction ##

This is a repository with my configuration files of my ArchLinux, following the
philosophy of simplicity and humanity. 

![screenshot](https://github.com/zhengfaxiang/dotfiles/blob/master/images/screenshot.png?raw=true)

## Content ##

This repo contains my config files of

  * [compton](https://github.com/chjj/compton)
  * [git](https://git-scm.com/)
  * [gtk](http://www.gtk.org/)
  * [i3wm](https://i3wm.org/)
  * [mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki)
  * [ncmpcpp](http://ncmpcpp.rybczak.net/)
  * [tmux](http://tmux.github.io/)
  * [x](http://www.x.org/wiki/)
  * [oh-my-zsh](http://ohmyz.sh/)

## Installation ##

First thing first, be sure that you have installed packages mentioned above as
well as `stow`. Then clone this repo to `~/.dotfiles`

```
git clone https://github.com/zhengfaxiang/dotfiles ~/.dotfiles
```

Then `cd ~/.dotfiles` and run the `stow_install.sh`

```
./stow_install.sh
```
