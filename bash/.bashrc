#!/bin/env bash
SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)

if [ -f $SCRIPT_DIR/git-completion.bash ]; then
    source $SCRIPT_DIR/git-completion.bash
fi

if [ -f $SCRIPT_DIR/git-prompt.sh ]; then
    source $SCRIPT_DIR/git-prompt.sh
fi

alias ll='ls -al'
alias ls='ls -F --color=auto --show-control-chars'
alias grep='grep --color=auto'

alias_windows() {
    alias python='py'
    alias python3='py'
    alias pip='py -m pip'
    alias pip3='py -m pip'
    alias venva='source .venv/Scripts/activate'
    alias venvd='deactivate'
}

if [ $OS == 'Windows_NT' ]; then
    alias_windows
fi
