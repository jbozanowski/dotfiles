function parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

RESET=$(tput sgr0)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
WHITE=$(tput setaf 7)
#PS1='\W \u\$ '
PS1="\[$GREEN\]\u\[$RESET\] \[$BLUE\]\W\[$RESET\] \[$GREEN\](\$([[ -n \$(git branch 2> /dev/null) ]])\[\033$MAGENTA\]\$(parse_git_branch)\[\033$GREEN\]) \$\[$RESET\] " 

PATH=$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin
export PATH

alias "ls=ls -G"

# Temporary solution to a ML bug.
unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH
