# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/local/opt/llvm/bin:$HOME/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
alias tn='tmux new bash'

# ryan 256 color support
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi
set -o vi

case $- in *i*) . ~/.bashrc;; esac

#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/System/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
source ~/git-completion.bash
