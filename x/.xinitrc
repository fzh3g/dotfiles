#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# fcitx
export LC_CTYPE=zh_CN.UTF-8
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
