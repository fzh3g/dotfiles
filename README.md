# Zhengfaxiang's ArchLinux Config Files #

## Introduction ##

This is a repository with my configuration files of my ArchLinux, following the
philosophy of simplicity and humanity. 

## Content ##

This repo contains my config files of

  * [Compton](https://github.com/chjj/compton)
  * [Git](https://git-scm.com/)
  * [Gtk](http://www.gtk.org/)
  * [I3wm](https://i3wm.org/)
  * [Mpd](http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki)
  * [Ncmpcpp](http://ncmpcpp.rybczak.net/)
  * [Redshift](http://jonls.dk/redshift/)
  * [Terminator](http://gnometerminator.blogspot.com/p/introduction.html)
  * [Tmux](http://tmux.github.io/)
  * [Vim](http://www.vim.org/)
  * [X](http://www.x.org/wiki/)
  * [Oh-my-zsh](http://ohmyz.sh/)

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
