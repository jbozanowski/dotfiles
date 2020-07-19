export ZSH="/Users/jbozanowski/.oh-my-zsh"

ZSH_THEME="fxr"

HIST_STAMPS="%F %H:%M:%S"

plugins=(git osx golang django)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=pl_PL.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'

alias "ls=ls -G"
alias k='kubectl'
alias ktx='kubectx'

export GOPATH="/Users/jbozanowski/Work/Go/Workspace"
export CDPATH=$CDPATH:$GOPATH/src

export GPG_TTY=$(tty)

export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"

export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/Users/jbozanowski/Library/Python/3.7/bin:$PATH"
export PATH="/Users/jbozanowski/Work/Go/Workspace/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"


eval "$(pyenv virtualenv-init -)"

