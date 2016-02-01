set -o vi
# alias tmux="TERM=screen-256color-bce tmux"
alias ls="ls -FGh"
alias vim="vim -O"
alias w3m="w3m -M"
alias gg="surfraw -browser=\"w3m\" google"
alias tmh="tmux select-layout even-horizontal"
alias tmv="tmux select-layout even-vertical"
alias tmh1="tmux select-layout main-horizontal"
alias tmv1="tmux select-layout main-vertical"
alias tmt="tmux select-layout tiled"
export PS1="\W \$((`pstree -p $$ | grep ranger | wc -l`)) "
export VISUAL=vim
export EDITOR="$VISUAL"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
export PATH=/usr/local/bin:/usr/local/opt/llvm/bin:$HOME/bin:$PATH
source ~/git-completion.bash
# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

