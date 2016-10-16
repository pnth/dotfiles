# activate greek keyboard when right alt is pressed

http://thelibrarybasement.com/2012/02/18/polytonic-greek-in-dvorak-layout-for-linux/
https://unstable.nl/andreas/el_dv.html_
setxkbmap -layout "us,gr" -variant "dvp,dvpoly" -option "ctrl:swapcaps,grp:switch"
setxkbmap -query
man xkeyboard-config


# set default terminal cinnamon
gsettings set org.cinnamon.desktop.default-applications.terminal exec /usr/bin/uxterm

# context menu run command
https://wiki.archlinux.org/index.php/Nemo#Nemo_Actions
https://github.com/linuxmint/nemo/blob/master/files/usr/share/nemo/actions/sample.nemo_action


