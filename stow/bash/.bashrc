# ~/.bashrc

# load .gitignore'd secrets
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

export QT_QPA_PLATFORMTHEME=qt6ct

export XDG_CONFIG_HOME=$HOME/.config

# export WOFI_CONFIG=/home/sv/.config/wofi/config
export TERM=xterm-256color
export COLORTERM=truecolor

export CUDA_HOME=/opt/cuda
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

export PATH="$HOME/.config/composer/vendor/bin:$PATH"

export OLLAMA_HOST=0.0.0.0
export OLLAMA_DEVICE=cuda

##################################################
# general
alias grep='grep --color=auto'
alias nano='nano -ET4 -i'

# ls
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias l='ls'

# git
alias gita='git add .'
alias gitc='git commit -m' # message to be inserted by user
alias gitp='git push origin'
alias gits='git status'
alias gitf='git fame --cost hour -wMC --format svg --min 1 > docs/authors.svg'

# docker
alias docker-nuke='docker container prune -f; docker image prune -af; docker volume prune -f; docker network prune -f'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcdv='docker compose down -v'

# ssh
alias ssh-vps='ssh -i $SECRET_VPS_KEY root@$SECRET_VPS_IP'

# $HOME/bin & $HOME/code/workflows
alias llm-clean='sudo rm -rf $HOME/code/workflow/open-webui/open-webui/{uploads/*,cache/audio/speech/*}'
