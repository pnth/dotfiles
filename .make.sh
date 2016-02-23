#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="surfraw.conf note tmux.conf vimrc wallpaper xinitrc xmobarrc xmonad Xresources zshrc zprofile inputrc"
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

ln -sf ~/dotfiles/w3m/config ~/.w3m/config
ln -sf ~/dotfiles/w3m/keymap ~/.w3m/keymap
ln -sf ~/dotfiles/ctags ~/.ctags
ln -sf ~/dotfiles/ycm_extra_conf.py ~/.ycm_extra_conf.py
ln -sf ~/dotfiles/vim/manually ~/.vim/manually
ln -sf /usr/bin/python2 ~/bin/python
ln -sf /usr/bin/python2-config ~/bin/python-config

## Configure
# cd ~.vim/plugged/YouCompleteMe
# ./install.py --clang-completer

#bluetooth
# sudo mv ~/dotfiles/btconnect.service /etc/systemd/system/
# sudo mv ~/dotfiles/10-local.rules  /etc/udev/rules.d/
cp ~/dotfiles/bt.sh ~/bin/

# for d in $dirs; do
#   echo "Moving any existing dotfiles from ~ to $olddir"
#   path=`dirname $d`
#   fname=`basename $d`
#   mkdir -p $olddir/$path
#   rm -fr $olddir/$d
#   mv -f ~/.$d $olddir/$path/
#
#   echo "Creating symlink to $file in home directory."
#   mkdir -p $dir/$path
#   ln -s $dir/$d ~/.$d
# done

