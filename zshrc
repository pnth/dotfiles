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

# PS1='\h \W\$ '
# PS1='\W\$ '
# source /etc/profile.d/autojump.bash
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$HOME/Dropbox/bin:$HOME/bin:/home/phuoc/.vim/plugged/perlomni.vim/bin:${PATH}:$JAVA_HOME/bin
export LD_LIBRARY_PATH=/usr/lib/
export LD_PRELOAD=/usr/lib/libstdc++.so.6
xset r rate 260 30
source /home/phuoc/Dropbox/bin/ipa
source /home/phuoc/Dropbox/bin/aliases
source /home/phuoc/dotfiles/bashrc-common
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# "
