export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# general stuff 
alias grep='grep --color'
alias ll='ls -l'
export PATH=$PATH:~/bin/
ssh-add -A ~/.ssh/id_rsa
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# bash history
export HISTFILESIZE=100000
export HISTSIZE=10000

# python
export PIP_WHEEL_DIR=~/wheels/
alias pipsi="pipsi --bin-dir ~/bin"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
source /usr/local/bin/virtualenvwrapper.sh

# git
source ~/bin/git-prompt.sh
source ~/bin/git-completion.bash
source ~/bin/gitparse.sh
function gitbrd () 
{
	git branch -d $(git branch --merged master | grep -v master)
}
# from http://stackoverflow.com/questions/5188320/how-can-i-get-a-list-of-git-branches-ordered-by-most-recent-commit
function gitlatest()
{
    git for-each-ref --sort=-committerdate --format='%(refname:lstrip=2)' refs/heads/ | head -n 10
}
alias g=git

# docker
alias dc=docker-compose
alias d=docker
function dkrm()
{
    docker rm $(docker ps -a -q -f status=exited)
}

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# enable buildkit
export DOCKER_BUILDKIT=1

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
