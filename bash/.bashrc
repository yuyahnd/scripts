#!/bin/env bash

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
