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

# docker
alias dc='docker-compose'
