#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Added by Toolbox App
export PATH="$PATH:/home/sv/.local/share/JetBrains/Toolbox/scripts"

export QT_QPA_PLATFORMTHEME=kde
# Added by Toolbox App
export PATH="$PATH:/home/sv/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:/home/sv/bin"

# Start ssh-agent if not already running
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/sv-github
fi
