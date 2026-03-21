
. "$HOME/.local/bin/env"

if [ -e /home/neon/.nix-profile/etc/profile.d/nix.sh ]; then . /home/neon/.nix-profile/etc/profile.d/nix.sh; fi 


PS1='┌──(%F{blue}%n%f㉿%F{cyan}%m%f)-[%B%F{blue}%~%b%f]
└─%(!.%F{red}#.%F{blue}$)%f '

# added by Nix installer

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias l='ls -l --color=auto'
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/neon/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/neon/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/neon/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/neon/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias firelist='sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=$i; if($i ~ /^DPT=/) dpt=$i} if(src && dpt) print src, dpt}'\'' | sort | uniq -c | sort -nr'
alias firelist_public='sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=$i; if($i ~ /^DPT=/) dpt=$i} if(src && dpt) print src, dpt}'\'' | grep -vE "SRC=(192\.168\.|10\.|172\.1[6-9]\.|172\.2[0-9]\.|172\.3[0-1]\.|127\.|0\.0\.0\.|169\.254\.|fe80:)" | sort | uniq -c | sort -nr'

alias firelist_csv='echo "count,src,dpt"; sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=substr($i,5); if($i ~ /^DPT=/) dpt=substr($i,5)} if(src && dpt) print src","dpt}'\'' | sort | uniq -c | awk '\''{print $1","$2}'\'''


alias firecount='sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=substr($i,5)} if(src) print src}'\'' | sort | uniq -c | sort -nr'

alias firecount_csv='echo "count,src"; sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=substr($i,5)} if(src) print src}'\'' | sort | uniq -c | sort -nr | awk '\''{print $1","$2}'\'


export PATH="$PATH:/home/neon/progs/commands"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/neon/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
