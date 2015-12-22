export SAL_USE_VCLPLUGIN=gen lowriter

envfile="$HOME/.gnupg/gpg-agent.env"
#if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#    eval "$(cat "$envfile")"
#else
#    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
#fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
export LD_LIBRARY_PATH=/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/server/

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

