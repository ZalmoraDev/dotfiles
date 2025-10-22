#
# ~/.bashrc
#

# Powerlevel-like terminal input
eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export WOFI_CONFIG=/home/sv/.config/wofi/config

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'

alias grep='grep --color=auto'
alias nano='nano -ET4 -i'
PS1='[\u@\h \W]\$ '
