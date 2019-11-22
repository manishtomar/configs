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

# GNUPG
[[ -r ~/.gpgrc ]] && . ~/.gpgrc

# docker laptop stuff
alias pass-find='find ~/.password-store -name \*.gpg | sed -e "s,$HOME/.password-store,,g" -e "s/.gpg$//" | grep -i'
alias sm='cd ~/go/src/github.com/docker/saas-mega'
alias ucpprod='cd ~/stuff/ucp/prod/ && eval "$(<env.sh)" && PS1="(UCPPROD) $PS1" && cd -'
alias ucpstage='cd ~/stuff/ucp/stage/ && eval "$(<env.sh)" && PS1="(UCPSTAGE) $PS1" && cd -'
function regurl()
{
	repo=$1
	shift
	url=$1
	shift
	token=$(curl -u "manisht:$(lpass show --notes dockerpat)" "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$repo:pull" | jq -r .token)
	curl https://registry-1.docker.io/v2/$repo/$url \
		-H "Authorization: Bearer $token" -L -H "Accept: application/vnd.docker.distribution.manifest.v2+json,application/vnd.docker.distribution.manifest.list.v2+json" "$@"
}

function noheaderregurl()
{
	repo=$1
	shift
	url=$1
	shift
	token=$(curl -u "manisht:$(lpass show --notes dockerpat)" "https://auth.docker.io/token?service=registry.docker.io&scope=repository:$repo:pull" | jq -r .token)
	curl https://registry-1.docker.io/v2/$repo/$url -H "Authorization: Bearer $token" -L "$@"
}

function stageregurl()
{
	repo=$1
	shift
	url=$1
	shift
	token=$(curl -u "manish:$(lpass show --notes dockerstagepat)" "https://auth-stage.docker.io/token?service=registry-1-stage.docker.io&scope=repository:$repo:pull" | jq -r .token)
	curl https://registry-1-stage.docker.io/v2/$repo/$url \
		-H "Authorization: Bearer $token" -L -H "Accept: application/vnd.docker.distribution.manifest.v2+json,application/vnd.docker.distribution.manifest.list.v2+json" "$@"
}

function v1stageregurl()
{
	repo=$1
	shift
	url=$1
	shift
	token=$(curl -u "manish:$(lpass show --notes dockerstagepat)" "https://auth-stage.docker.io/token?service=registry-1-stage.docker.io&scope=repository:$repo:pull" | jq -r .token)
	curl https://registry-1-stage.docker.io/v2/$repo/$url -H "Authorization: Bearer $token" -L "$@"
}

function swarmtaskstatus()
{
	docker inspect $1 | jq .[0].Status
}
alias btprod='eval $(lpass show -p 9125129690469393413 | bt login --username manisht --password-stdin --environment prod)'
alias btstage='eval $(lpass show -p stage.docker.com | bt login --username manish --password-stdin --environment stage)'
alias regstagelogin='lpass show --notes dockerstagepat  | docker login -u manish --password-stdin registry-1-stage.docker.io'
alias regprodlogin='lpass show --notes dockerpat  | docker login -u manisht --password-stdin'
alias highlandaws='export AWS_ACCESS_KEY_ID=$(lpass show -u highland-aws-keys) AWS_SECRET_ACCESS_KEY=$(lpass show -p highland-aws-keys)'
alias testaws='export AWS_ACCESS_KEY_ID=$(lpass show -u docker-core-aws-keys) AWS_SECRET_ACCESS_KEY=$(lpass show -p docker-core-aws-keys)'
alias dockeraws='eval $(aws-okta exec ds -- env | grep AWS | sed "s/^/export /")'
alias stageregaws='export AWS_ACCESS_KEY_ID=$(pass show infra/aws/stage-us-east-1/s3/registry/access) AWS_SECRET_ACCESS_KEY=$(pass show infra/aws/stage-us-east-1/s3/registry/secret)'
alias maniaws='export AWS_ACCESS_KEY_ID=$(lpass show -u maniawskey) AWS_SECRET_ACCESS_KEY=$(lpass show -p maniawskey)'

# enable buildkit
export DOCKER_BUILDKIT=1

# okta
export AWS_OKTA_MFA_PROVIDER=okta
export AWS_OKTA_MFA_FACTOR_TYPE=push

# bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
