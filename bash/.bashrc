#!/bin/env bash
SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)

if [ -f $SCRIPT_DIR/git-completion.bash ]; then
    source $SCRIPT_DIR/git-completion.bash
fi

if [ -f $SCRIPT_DIR/git-prompt.sh ]; then
    source $SCRIPT_DIR/git-prompt.sh
fi

PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
PS1="$PS1"'\n'                         # new line
PS1="$PS1"'\[\033[32m\]'               # change to green
PS1="$PS1"'\u@\h '                     # user@host<space>
PS1="$PS1"'\[\033[35m\]'               # change to purple
PS1="$PS1"'\[\033[33m\]'               # change to brownish yellow
PS1="$PS1"'\w'                         # current working directory
PS1="$PS1"'\[\033[36m\]'               # change color to cyan
PS1="$PS1"'`__git_ps1`'                # bash function
PS1="$PS1"'\[\033[0m\]'                # change color
PS1="$PS1"' $VIRTUAL_ENV_PROMPT'       # venv prompt
PS1="$PS1"'\n'                         # new line
PS1="$PS1"'$ '                         # prompt: always $

alias ll='ls -al'
alias ls='ls -F --color=auto --show-control-chars'
alias grep='grep --color=auto'

if type sed > /dev/null 2>&1; then
    alias paths='echo $PATH | sed "s/:/\n/g"'
fi

alias_windows() {
    alias python='py'
    alias python3='py'
    alias pip='py -m pip'
    alias pip3='py -m pip'
    alias venva='source .venv/Scripts/activate'
    alias venvd='deactivate'
}


if [ "$(uname)" == "Darwin" ]; then
    echo "Mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    alias_windows
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Linux"
else
    echo "Unknown OS"
fi
