#!/usr/bin/env zsh
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# git prompt
if [ -f $SCRIPT_DIR/git-prompt.sh ]; then
    source $SCRIPT_DIR/git-prompt.sh
fi

# enable completion
autoload -U compinit
compinit

# git command
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# git prompt
PROMPT='
%B%F{red}%n@%m%f%b %F{green}%~%f %F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# alias ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ssh-agent
alias saa='ssh-add --apple-load-keychain'

# docker-compose
if type dockcer-compose > /dev/null 2>&1; then
    alias dc='docker-compose'
fi

 # python
 if type python3 > /dev/null 2>&1; then
    alias python='python3'
    alias pip='python3 -m pip'
    alias pip3='python3 -m pip'
    alias venva='source .venv/bin/activate'
    alias venvd='deactivate'
 fi
