#
# ~/.bashrc
#

# Powerlevel-like terminal input
eval "$(starship init bash)"

# nvm - Node Version Manager initializaiton
source /usr/share/nvm/init-nvm.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export WOFI_CONFIG=/home/sv/.config/wofi/config

# ls
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'

alias grep='grep --color=auto'
alias nano='nano -ET4 -i'
PS1='[\u@\h \W]\$ '

# git
alias gita='git add .'
alias gitc='git commit -m' # message to be inserted by user
alias gitp='git push origin'
