RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"
GRAY="\[33[1;30m\]"
LIGHT_GRAY="\[33[0;37m\]"

function prefix() {
	echo ${PREFIX}
}

#PS1="$GREEN\u@machine$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "
PS1="\n$GREEN\u$NO_COLOUR:\w$YELLOW\$(__git_ps1)$NO_COLOUR\\n$ "
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
#PS1="$LIGHT_GRAY\u@\h$NO_COLOR:\w$GRAY\$(parse_git_branch)$NO_COLOR\$ "
