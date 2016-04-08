#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files/folders to symlink in homedir
files="surfraw.conf tmux.conf vimrc wallpaper xinitrc Xresources zshrc zprofile inputrc"
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
mkdir -p ~/.config/ranger/
mkdir -p ~/.config/zathura/
mkdir -p ~/.config/i3/
mkdir -p ~/.config/ranger/colorschemes
mkdir -p ~/.local/share/applications
echo "set colorscheme solarized" > ~/.config/ranger/rc.conf
curl https://raw.githubusercontent.com/hut/ranger/master/ranger/colorschemes/solarized.py > ~/.config/ranger/colorschemes/solarized.py
ln -sf /usr/bin/python2 ~/bin/python
ln -sf /usr/bin/python2-config ~/bin/python-config
ln -sf ~/dotfiles/config/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sf ~/dotfiles/config/zathura/zathurarc ~/.config/zathura/zathurarc
ln -sf ~/dotfiles/ctags ~/.ctags
ln -sf ~/dotfiles/vim/manually ~/.vim/manually
ln -sf ~/dotfiles/w3m/config ~/.w3m/config
ln -sf ~/dotfiles/w3m/keymap ~/.w3m/keymap
ln -sf ~/dotfiles/ycm_extra_conf.py ~/.ycm_extra_conf.py
ln -sf ~/dotfiles/config/i3/config ~/.config/i3/config
ln -sf ~/dotfiles/conkyrc ~/.conkyrc
ln -sf ~/dotfiles/bin/conky-i3bar ~/bin/conky-i3bar
ln -sf ~/dotfiles/bin/conky-i3bar ~/bin/conky-i3bar
ln -sf ~/dotfiles/local/share/applications ~/.local/share/
xdg-mime default vim.desktop $(grep '^text/*' /usr/share/mime/types)
#bluetooth
# sudo mv ~/dotfiles/btconnect.service /etc/systemd/system/
# sudo mv ~/dotfiles/10-local.rules  /etc/udev/rules.d/
#cp ~/dotfiles/bt.sh ~/bin/

#font
#sudo pacman -S ttf-liberation ttf-freefont

