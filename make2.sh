#!/bin/bash
files="note tmux.conf vimrc wallpaper xinitrc xmobarrc xmonad Xresources zshrc zprofile "    
dirs="local/share/luakit/styles"

for file in $files; do
    git add $file 
done


for d in $dirs; do
    git add $d 
done
