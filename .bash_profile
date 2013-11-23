#export PS1="\u@\h\w$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/share/python/virtualenvwrapper.sh
source ~/bin/gitparse.sh
source ~/bin/git-completion.bash

alias grep='grep --color'
