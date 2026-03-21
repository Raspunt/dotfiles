if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    # Определяем цвета
    set -l normal (set_color normal)
    set -l user_color (set_color blue)
    set -l host_color (set_color cyan)
    set -l path_color (set_color brblue)
    set -l bracket_color (set_color white)

    # Символ приглашения в зависимости от прав
    if test (id -u) -eq 0
        set prompt_symbol '#'
        set prompt_color (set_color red)  # для root оставим красный, чтобы выделить
    else
        set prompt_symbol '$'
        set prompt_color (set_color blue)
    end

    # Первая строка: ┌──(user㉿host)-[path]
    echo -n "┌──("
    echo -n $user_color(whoami)$normal
    echo -n "㉿"
    echo -n $host_color(hostname)$normal
    echo -n ")-["
    echo -n $path_color(prompt_pwd)$normal
    echo "]"

    # Вторая строка: └─$ (или └─# для root)
    echo -n "└─"
    echo -n $prompt_color$prompt_symbol $normal
end


alias firelist='sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=$i; if($i ~ /^DPT=/) dpt=$i} if(src && dpt) print src, dpt}'\'' | sort | uniq -c | sort -nr'
alias firelist_public='sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=$i; if($i ~ /^DPT=/) dpt=$i} if(src && dpt) print src, dpt}'\'' | grep -vE "SRC=(192\.168\.|10\.|172\.1[6-9]\.|172\.2[0-9]\.|172\.3[0-1]\.|127\.|0\.0\.0\.|169\.254\.|fe80:)" | sort | uniq -c | sort -nr'

alias firelist_csv='echo "count,src,dpt"; sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=substr($i,5); if($i ~ /^DPT=/) dpt=substr($i,5)} if(src && dpt) print src","dpt}'\'' | sort | uniq -c | awk '\''{print $1","$2}'\'''


alias firecount='sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=substr($i,5)} if(src) print src}'\'' | sort | uniq -c | sort -nr'

alias firecount_csv='echo "count,src"; sudo journalctl | grep "IN=" | awk '\''{for(i=1;i<=NF;i++){if($i ~ /^SRC=/) src=substr($i,5)} if(src) print src}'\'' | sort | uniq -c | sort -nr | awk '\''{print $1","$2}'\'


export PATH="$PATH:/home/neon/progs/commands"    
export PATH="$PATH:/usr/local/go/bin"


# export PATH="$PATH:/home/neon/.config/hypr/scripts"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/neon/miniconda3/bin/conda
    eval /home/neon/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/neon/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/neon/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/neon/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<


set PATH $PATH ~/.cargo/bin

# pnpm
set -gx PNPM_HOME "/home/neon/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
