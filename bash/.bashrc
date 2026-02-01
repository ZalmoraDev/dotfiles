# ~/.bashrc

PS1='[\u@\h \W]\$ '

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

# export WOFI_CONFIG=/home/sv/.config/wofi/config
export TERM=xterm-256color
export COLORTERM=truecolor

export OLLAMA_HOST=0.0.0.0

##################################################

# general
# Rename to all lowercase with hyphens for spaces/underscores
re2linform() {
    perl-rename 'y/A-Z/a-z/; s/[ _]+/-/g; s/-+/-/g' "$@"
}

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

# docker / podman
# I can't be bothered
alias docker-nuke='docker container prune -f; docker image prune -af; docker volume prune -f; docker network prune -f'
# Starts/Stops: [Ollama, Docker] open-webui, SearXNG & Kokoro-FastAPI (TTS)
llm() {
  case "$1" in
    start-max)
      sudo systemctl start ollama docker || return
      docker compose -p llm start
      ;;
    stop-max)
      docker compose -p llm stop || return
      sudo systemctl stop docker ollama
      ;;
    start-min)
      docker compose -p llm start
      ;;
    stop-min)
      docker compose -p llm stop
      ;;
    *)
      echo "Usage: llm {start-max|stop-max|start-min|stop-min}"
      ;;
  esac
}

alias llm-clean='sudo rm -rf /home/sv/code/containers/llm/open-webui/uploads/* /home/sv/code/containers/llm/open-webui/cache/audio/speech/*'

# ssh
alias ssh-vps='ssh -i $SECRET_VPS_KEY root@$SECRET_VPS_IP'


