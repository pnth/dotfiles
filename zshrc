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
autoload -Uz promptinit
promptinit
# End of lines added by compinstall

bindkey "\eOc" forward-word
bindkey "\eOd" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

source ~/dotfiles/bashrc-common
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$HOME/Dropbox/bin:$HOME/bin:/home/phuoc/.vim/plugged/perlomni.vim/bin:${PATH}:$JAVA_HOME/bin:$HOME/packages/julia5/bin

xset r rate 260 30
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
