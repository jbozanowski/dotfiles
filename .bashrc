function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
WHITE=$(tput setaf 7)
PS1="\[$GREEN\]\D{%m-%d-%s} \t\[$RESET\] \[$BLUE\]\W\[$RESET\] \[$GREEN\](\$([[ -n \$(git branch 2> /dev/null) ]])\[\033$MAGENTA\]\$(parse_git_branch)\[\033$GREEN\]) \$\[$RESET\] "

# Go setup.
export GOPATH=$HOME/Work/Go/Workspace
PATH=$PATH:$GOPATH/bin
export PATH

EDITOR=/usr/bin/vim
export EDITOR

# istio manual install in /opt
export PATH=/opt/istio/bin:$PATH

alias "ls=ls -G"
alias curl-ajax='curl -H "X-Requested-With: XMLHttpRequest"'
alias k='kubectl'

export LC_ALL=pl_PL.UTF-8
export LANG=en_US.UTF-8
