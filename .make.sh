#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="surfraw.conf tmux.conf vimrc wallpaper xinitrc bashrc bash_profile zshrc zprofile inputrc"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv -f ~/.$file ~/$olddir/
  echo "Creating symlink to $file in home directory."
  ln -sf $dir/$file ~/.$file
done

# Manual
mkdir -p ~/.w3m
mkdir -p ~/bin
mkdir -p ~/.vim
mkdir -p ~/.config/zathura/
mkdir -p ~/.config/i3/
mkdir -p ~/.config/i3status/
mkdir -p ~/.config/ranger/colorschemes
mkdir -p ~/.local/share/applications
echo "set colorscheme solarized" > ~/.config/ranger/rc.conf
curl https://raw.githubusercontent.com/hut/ranger/master/ranger/colorschemes/solarized.py > ~/.config/ranger/colorschemes/solarized.py
# ln -sf ~/dotfiles/config/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/dotfiles/vim/manually ~/.vim/manually
ln -sf ~/dotfiles/w3m/config ~/.w3m/config
ln -sf ~/dotfiles/w3m/keymap ~/.w3m/keymap
ln -sf ~/dotfiles/ycm_extra_conf.py ~/.ycm_extra_conf.py
ln -sf ~/dotfiles/config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/config/i3status/config ~/.config/i3status/config
ln -sf ~/dotfiles/conkyrc ~/.conkyrc
ln -sf ~/dotfiles/bin/conky-i3bar ~/bin/conky-i3bar

# neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
# Xresources manually
