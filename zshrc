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

alias ls='ls --color=auto'
export VISUAL="vim"
alias vim="vim --servername VIM"
setopt PROMPT_SUBST
PROMPT='%F{cyan}%c%#%f '
#PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '
#PROMPT=$'%{\e[0;35m%}%B┌─[%b%{\e[0;34m%}%n%{\e[0m%}@%{\e[0;34m%}%m%{\e[0;35m%}%B]%b%{\e[1;35m%}[%b%{\e[0;34m%}%~%{\e[0;35m%}%B]
#%{\e[0;35m%}%B└─╼%b%{\e[1;30m%}%{\e[0m%} '

