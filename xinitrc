#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xsetroot -cursor_name left_ptr
#setxkbmap -option ctrl:swapcaps
xmodmap -e 'remove Mod1 = Alt_R'
xmodmap -e 'add Mod3 = Alt_R'
dropbox&
udiskie -2 &
sudo ntpd -gq&
# ibus-daemon --xim &
/usr/bin/VBoxClient-all &
# urxvt&
DISPLAY=:0.0 feh --bg-scale "$(find ~/.wallpaper/ |shuf -n1)"&
#exec xmonad
ibus-daemon --xim &
exec i3



