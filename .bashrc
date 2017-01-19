export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# general stuff 
alias grep='grep --color'
export PATH=$PATH:~/bin/
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# bash history
export HISTFILESIZE=10000

# python
export PYTHONSTARTUP=~/.pythonrc
export PIP_WHEEL_DIR=~/wheels/
alias pipsi="pipsi --bin-dir ~/bin"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

# git
source ~/bin/gitparse.sh
source ~/bin/git-completion.bash
function gitbrd () 
{
    git branch -d `git branch --merged master | grep -v master`
}
# from http://stackoverflow.com/questions/5188320/how-can-i-get-a-list-of-git-branches-ordered-by-most-recent-commit
function gitlatest()
{
    git for-each-ref --sort=-committerdate refs/heads/ | head -n 10
}

# docker
alias dc=docker-compose
function dkrm()
{
    docker rm $(docker ps -a -q -f status=exited)
}

export CURL_CA_BUNDLE=$HOME/.ssh/cacert.pem
export SSL_CERT_FILE=$HOME/.ssh/cacert.pem
