#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export SAL_USE_VCLPLUGIN=gen lowriter
envfile="$HOME/.gnupg/gpg-agent.env"
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
export LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/server/
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
