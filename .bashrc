export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# general stuff 
alias grep='grep --color'
alias ll='ls -l'
export PATH=$PATH:~/bin/

# bash history
export HISTFILESIZE=10000

# python
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

# GNUPG
[[ -r ~/.gpgrc ]] && . ~/.gpgrc

# docker laptop stuff
alias pass-find='find ~/.password-store -name \*.gpg | sed -e "s,$HOME/.password-store,,g" -e "s/.gpg$//" | grep -i'
alias ucpprod='cd ~/stuff/ucp/prod/ && eval "$(<env.sh)" && PS1="(UCPPROD) $PS1" && cd -'
alias ucpstage='cd ~/stuff/ucp/stage/ && eval "$(<env.sh)" && PS1="(UCPSTAGE) $PS1" && cd -'
function regurl()
{
	repo=$1
	shift
	url=$1
	shift
	token=$(curl -u "manisht:$(lpass show -p docker.com)" "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$repo:pull" | jq -r .token)
	curl https://registry-1.docker.io/v2/$repo/$url \
		-H "Authorization: Bearer $token" -L -H "Accept: application/vnd.docker.distribution.manifest.v2+json,application/vnd.docker.distribution.manifest.list.v2+json" "$@"
}
function stageregurl()
{
	repo=$1
	shift
	url=$1
	shift
	token=$(curl -u "manish:$(lpass show -p stage.docker.com)" "https://auth-stage.docker.io/token?service=registry-1-stage.docker.io&scope=repository:$repo:pull" | jq -r .token)
	curl https://registry-1-stage.docker.io/v2/$repo/$url \
		-H "Authorization: Bearer $token" -L -H "Accept: application/vnd.docker.distribution.manifest.v2+json,application/vnd.docker.distribution.manifest.list.v2+json" "$@"
}
alias btprod='eval $(lpass show -p 9125129690469393413 | bt login --username manisht --password-stdin --environment prod)'
alias btstage='eval $(lpass show -p stage.docker.com | bt login --username manish --password-stdin --environment stage)'
alias regstagelogin='lpass show -p stage.docker.com  | docker login -u manish --password-stdin registry-1-stage.docker.io'
alias regprodlogin='lpass show -p docker.com  | docker login -u manisht --password-stdin'
alias highlandaws='export AWS_ACCESS_KEY_ID=$(lpass show -u highland-aws-keys) AWS_SECRET_ACCESS_KEY=$(lpass show -p highland-aws-keys)'
alias testaws='export AWS_ACCESS_KEY_ID=$(lpass show -u docker-core-aws-keys) AWS_SECRET_ACCESS_KEY=$(lpass show -p docker-core-aws-keys)'
alias dockeraws='export AWS_ACCESS_KEY_ID=$(lpass show -u docker-aws-keys) AWS_SECRET_ACCESS_KEY=$(lpass show -p docker-aws-keys)'

# enable buildkit
export DOCKER_BUILDKIT=1

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
