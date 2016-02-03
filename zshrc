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

function gitp() {
	git add .
	git commit -a -m "$1"
	git push
}

