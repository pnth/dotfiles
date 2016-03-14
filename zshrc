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
alias ls="ls -FGh --color=auto"
alias ranger='python3 /usr/bin/ranger'
alias tmh1="tmux select-layout main-horizontal"
alias tmh="tmux select-layout even-horizontal"
alias tmt="tmux select-layout tiled"
alias tmv1="tmux select-layout main-vertical"
alias tmv="tmux select-layout even-vertical"
alias vim="vim -O --servername VIM"
alias w3m="w3m -M"
export EDITOR="$VISUAL"
export PATH=$HOME/bin:${PATH}
export PS1="\W \$((`pstree -p $$ | grep ranger | wc -l`)) "
export VISUAL="vim"
export VISUAL=vim
export TERM=rxvt-unicode-256color
PROMPT='%F{cyan}%c%#%f '
setopt PROMPT_SUBST

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

function gitp() {
	git add .
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

