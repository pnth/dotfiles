#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="note tmux.conf vimrc wallpaper xinitrc xmobarrc xmonad Xresources zshrc zprofile inputrc"
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

