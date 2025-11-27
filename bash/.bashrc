# ~/.bashrc

PS1='[\u@\h \W]\$ '

# load .gitignore'd secrets (screw you Kali users)
secrets="$HOME/dotfiles/.secrets"
if [ -f "$secrets" ]; then
    source "$secrets"
fi

##################################################

# set starship (powerlevel-10k'ish) terminal input
eval "$(starship init bash)"

# nvm - Node Version Manager initializaiton
source /usr/share/nvm/init-nvm.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export WOFI_CONFIG=/home/sv/.config/wofi/config
export TERM=xterm-256color
export COLORTERM=truecolor

##################################################

# general
# Not fully-automatic, since that would bring risks
alias updateall='sudo pacman -Syu; yay -Syu; flatpak update'

# ls
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'

# nano
alias grep='grep --color=auto'
alias nano='nano -ET4 -i'

# git
alias gita='git add .'
alias gitc='git commit -m' # message to be inserted by user
alias gitp='git push origin'

# docker
# I can't be bothered
alias docker-nuke='docker container prune -f; docker image prune -af; docker volume prune -f; docker network prune -f'

# ssh
alias ssh-vps='ssh -i $SECRET_VPS_KEY root@$SECRET_VPS_IP'
