#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\W\$ '
shopt -s autocd
shopt -s checkwinsize
source /etc/profile.d/autojump.bash

alias vimm="vim -u ~/.vimrc0"
alias gg="surfraw -browser=\"w3m -num\" google"
alias ls=" ls -FGh "
alias cd=" cd"
alias dh=" dh"
alias dirs=" dirs"
alias tmh1="tmux select-layout main-horizontal"
alias tmh="tmux select-layout even-horizontal"
alias tmt="tmux select-layout tiled"
alias tmv1="tmux select-layout main-vertical"
alias tmv="tmux select-layout even-vertical"
alias matlab="/usr/local/MATLAB/MATLAB_Production_Server/R2015a/bin/matlab"
alias vim="/usr/bin/nvim -O"
alias w3m="/usr/bin/w3m -M"
alias matlab="/usr/local/matlab/R2015a/bin/matlab"
alias yano="yaourt --noconfirm -S "
export VISUAL=vim
export EDITOR="$VISUAL"
export SYSTEMD_EDITOR="vim"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$HOME/bin:/home/phuoc/.vim/plugged/perlomni.vim/bin:${PATH}:$JAVA_HOME/bin
export LD_LIBRARY_PATH=/usr/lib/
export LD_PRELOAD=/usr/lib/libstdc++.so.6
export TERM=rxvt-unicode-256color

# Phuoc's
function gitp() {
	git add *
  if [ $# -eq 0 ]
  then
    git commit -a -m `hostname`
  else
    git commit -a -m "$1"
  fi
	git push
}

function batt() {
  sudo tpacpi-bat -s ST 0 40
  sudo tpacpi-bat -s ST 1 40
  sudo tpacpi-bat -s ST 2 40
  sudo tpacpi-bat -s SP 0 80
  sudo tpacpi-bat -s SP 1 80
  sudo tpacpi-bat -s SP 2 80

  sudo tpacpi-bat -g ST 0
  sudo tpacpi-bat -g ST 1
  sudo tpacpi-bat -g ST 2
  sudo tpacpi-bat -g SP 0
  sudo tpacpi-bat -g SP 1
  sudo tpacpi-bat -g SP 2

  sleep 1
  cat /sys/class/power_supply/BAT0/uevent
  cat /sys/class/power_supply/BAT1/uevent
  cat /sys/class/power_supply/BAT2/uevent
  date
}

function x() {
	if [ $1 = "1" ]; then
		xrandr --output LVDS1 --off
		xrandr --output VGA1 --auto
	else
		xrandr --output VGA1 --off
		xrandr --output LVDS1 --auto
	fi
}

function pdf31(){
  pdfnup --nup "3x1" --no-landscape --suffix nup "$2"
}

function pdf22(){
  pdfnup --nup 2x2 --landscape --suffix nup "$1"
}

function wifi() {
  sudo killall wpa_supplicant
	if [ "$1" = "ap" ]
  then
    sudo wifi-menu
  elif [ "$1" = "phone"   ]
  then
    sudo wpa_supplicant -B -i wlan0 -c ~/Dropbox/wpa-phone.conf
    sudo dhcpcd wlan0
	else
    sudo wpa_supplicant -B -i wlan0 -c ~/Dropbox/wpa-edu.conf
    sudo dhcpcd wlan0
    # sleep 4
    # sudo mount /mnt/share
	fi
}

function def() {
	gg define "$1"
}

function md2lyx() {
	pandoc -s "$1.md" -o "$1.tex"
	tex2lyx "$1.tex"
}

function lyx2md() {
	pandoc -s "$1.md" -o "$1.tex"
	tex2lyx "$1.tex"
}

function theme() {
  if [ "$1" = "dark" ]; then
    ln -sf ~/dotfiles/theme-dark.vim ~/dotfiles/theme.vim
    ln -sf ~/dotfiles/Xresouces-colour-dark ~/.config/Xresouces-colour
    ln -sf ~/dotfiles/config_terminator_config-dark ~/.config/terminator/config
    # cat > .Xresources <<- EOM
  # #include "./dotfiles/Xresources-450"
  # #include "./dotfiles/Xresourcesdark"
  # EOM
    else
    ln -sf ~/dotfiles/theme-light.vim ~/dotfiles/theme.vim
    ln -sf ~/dotfiles/Xresouces-colour-light ~/.config/Xresouces-colour
    ln -sf ~/dotfiles/config_terminator_config-light ~/.config/terminator/config
    # cat > .Xresources <<- EOM
  # #include "./dotfiles/Xresources-450"
  # #include "./dotfiles/Xresources"
  # EOM
    fi
    xrdb ~/.Xresources
}

# function lyx() {
#   xrdb ~/dotfiles/Xresources-light
#   /usr/bin/lyx "$1"
#   xrdb ~/.Xresources
# }

function bt() {
  sleep 4
  bluetoothctl << EOF
power on
connect F0:65:DD:BA:37:87
connect E7:87:1B:8E:47:4D
EOF
}

function pacup(){
  sudo pacman -Syu | tee ".log/pacman_update_`date`.log"
}


function downgrade(){
  sudo pacman -U /var/cache/pacman/pkg/tmux-2.1-2-x86_64.pkg.tar.xz
}


function mkgrub(){
  sudo grub-mkconfig -o /boot/grub/grub.cfg
}


function xo(){
  DISPLAY=:$1 xdg-open $2
}


function dvp(){
  setxkbmap -layout us -variant dvp -option ctrl:swapcaps
}

function aaa(){
  setxkbmap -layout us -variant dvp -option ctrl:swapcaps
}

function keycode(){
  xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

function memfree(){
  awk '/MemFree/ {print $2}' /proc/meminfo | xargs -d '\n' printf '%sK' | numfmt --from=iec | numfmt --to=iec
  awk '/MemAvailable/ {print $2}' /proc/meminfo | xargs -d '\n' printf '%sK' | numfmt --from=iec | numfmt --to=iec
}

# function bookit(){
#   mkdir /tmp/pdf
#   cur_dir=`pwd`
#   rm -f /tmp/pdf/*
#   fname=`basename $1 .pdf`

#   # crop
#   java -jar /usr/share/briss/briss-0.9.jar -s "$1" -d /tmp/pdf/a.pdf

#   cd /tmp/pdf

#   # pad to a4 size
#   pdfnup --nup 1x1 --a4paper --no-landscape -o a.pdf a.pdf

#   # nup 1x2
#   pdfnup --nup 2x1 --a4paper --landscape -o a.pdf a.pdf

#   # rotate even/odd pages
#   pdftk A=a.pdf shuffle Aoddeast Aevenwest output "$cur_dir/${fname}-book.pdf"

#   # mv /tmp/pdf/a.pdf "$cur_dir/${fname}-book.pdf"
#   cd $cur_dir
# }

