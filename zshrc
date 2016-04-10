# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignorespace
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/phuoc/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

alias gg="surfraw -browser=\"w3m -num\" google"
alias ls=" ls -FGh --color=auto"
alias cd=" cd"
alias dh=" dh"
alias dirs=" dirs"
alias mmv="zmv -U"
alias tmh1="tmux select-layout main-horizontal"
alias tmh="tmux select-layout even-horizontal"
alias tmt="tmux select-layout tiled"
alias tmv1="tmux select-layout main-vertical"
alias tmv="tmux select-layout even-vertical"
alias matlab="/usr/local/MATLAB/MATLAB_Production_Server/R2015a/bin/matlab"
alias vim="/usr/bin/vim -O --servername VIM"
alias w3m="/usr/bin/w3m -M"
alias matlab="/usr/local/matlab/R2015a/bin/matlab"
alias yano="yaourt --noconfirm"
export VISUAL=vim
export EDITOR="$VISUAL"
export SYSTEMD_EDITOR="vim"
export PATH=$HOME/bin:${PATH}
export LD_LIBRARY_PATH=/usr/lib/
export LD_PRELOAD=/usr/lib/libstdc++.so.6
autoload zmv

#
CURPROCID=`ps | head -2 | tail -1 | awk '{print $1}'`
NRANGER=`pstree $CURPROCID | sed 's/ranger/ranger\n/g' | grep -c "ranger"`
# export PS1="\W \$((`echo \$NRANGER`)) "
export PS1="\W \$((`pstree -p $$ | grep ranger | wc -l`)) "
export TERM=rxvt-unicode-256color
PROMPT='%F{cyan}%c%#%f '
setopt PROMPT_SUBST
xset r rate 250 30

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

setopt HIST_IGNORE_DUPS
# Search history begin current word
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward


# Alt left/up to change directory
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey


# Dir stack: dirs -v, cd -<NUM>
alias dh='dirs -v'
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
DIRSTACKSIZE=9
# if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#   dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#   [[ -d $dirstack[1] ]] && cd $dirstack[1]
# fi
# chpwd() {
#   print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
# }
# DIRSTACKSIZE=20
# setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
# ## Remove duplicate entries
# setopt PUSHD_IGNORE_DUPS
# ## This reverts the +/- operators.
# setopt PUSHD_MINUS
# Christian Neukirchen
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}


# Phuoc's
function gitp() {
	git add *
	git commit -a -m "$1"
	git push
}

function batt() {
	sudo tpacpi-bat -v -s ST 1 40
	sudo tpacpi-bat -v -s SP 1 80
	sudo tpacpi-bat -v -g ST 1
	sudo tpacpi-bat -v -g SP 1
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
	if [ $1 = "light" ]; then
    ln -sf ~/dotfiles/Xresources-light ~/.Xresources
    ln -sf ~/dotfiles/config/zathura/zathurarc-light ~/.config/zathura/zathurarc
	else
    ln -sf ~/dotfiles/Xresources ~/.Xresources
    ln -sf ~/dotfiles/config/zathura/zathurarc ~/.config/zathura/zathurarc
	fi
  xrdb ~/.Xresources
}

function lyx() {
  xrdb ~/dotfiles/Xresources-light
  /usr/bin/lyx "$1"
  xrdb ~/.Xresources
}

