# Load confidential info

export PATH=$PATH:/home/krao/.local/bin
# avoid bash to rename windows title ( usefull for OBS and i3 )
umask 077
unset PROMPT_COMMAND
# set a sound after command
#export PROMPT_COMMAND="aplay -q ~/Downloads/Saw.wav"

export LC_ALL=en_US.UTF-8
#export LC_ALL=fr_FR.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export BROWSER=qutebrowser
export EDITOR=vim

export PRINTER=brother

export GITHUBUSER=s-loiseau
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1 #export GIT_PS1_DESCRIBE_STYLE='contains'
export GIT_PS1_SHOWUPSTREAM='legacy git'
alias gadd='git add'
alias gcom='git commit -m'
alias gdif='git diff'
alias ggra='git log --graph'
alias glog='git log --oneline --format="%Cgreen%h%Creset:%cr:%an:%s"|head -10|column -t -s:'
alias glogf='git log --oneline --format="%Cgreen%h%Creset:%cr:%an:%s"|column -t -s:'
alias gls='git ls-files'
alias gsho='git show'
alias gsta='git status -bs'
alias ghs="git status -bs"
alias ghc='git commit -m "$(read)"'

# use ;y (hint links yank) first in qutebrowse
alias ytdlmp3clip='cd ~/Music ; youtube-dl --extract-audio --audio-format mp3 $(getc); cd -'
alias ytdlvideo='cd ~/Videos/ ; youtube-dl $(getc); cd -'

alias caly='cal -mwy'
alias cdc='cd ~/Code/'
alias tmux='tmux -2'

alias rmux='if [ -z "$(tmux ls)" ]; then tmux ;else tmux attach -t 0 ; fi'
alias shodim='echo $COLUMNS $LINES'
alias shofontb='ls -rlth /usr/share/kbd/consolefonts/'
alias kcli='keepassxc-cli'
alias ffeh='nohup feh -. -g 640x360 -xq &>/dev/null &'

alias jj='ls -1l --color'
alias lf='ls -tl --color'
alias ll='ls -lGg'
alias lla='ls -atlGg --color'
alias lls='ls -rlthGg | lolcat'
alias ls='ls -1 -Gg --color --group-directories-first'

alias i3c='vi ~/.config/i3/config'

# PACMAN
# list
alias pacl="pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | sort -h"
# install
alias paci="sudo pacman -S"
# clean cache
alias pacc="sudo pacman -Sc"
# uninstall
alias pacr="sudo pacman -R"
# search
alias pacs="pacman -Ss"
# update base
alias pacu="sudo pacman -Sy"

alias stacups='sudo systemctl start cups'
alias stocups='sudo systemctl stop cups'


alias tshow='while true; do clear; transmission-remote -l | sed "s/100%/$(tput setaf 2)100%$(tput sgr0)/"; sleep 5 ; done'
alias tstart='transmission-daemon -w ~/Videos && sleep 3 ; tshow' 
alias tstop='transmission-remote --exit'

#alias subl='subliminal download -l fr'
#alias subli='subliminal download -l en -l fr'

alias vi='vim'

alias wnetl='watch -n1 "netstat -4lnap 2>/dev/null | sort"'
alias wnets='watch -n1 "netstat -4nap 2>/dev/null | egrep \"ESTABLISHED|LISTEN\" | sort"'
alias netl='netstat -4lanp 2>/dev/null | sort'
alias nets='netstat -4nap 2>/dev/null | grep "ESTABLISHED" | sort'

alias www='w3m www.duckduckgo.com'

alias xreload='xrdb ~/.Xresources'

alias canit='sudo nmap -sP $(fips) '

alias pdf='cd ~/Documents/PDF/;mupdf "$(fzf)" & cd'

alias getc='xclip -selection clipboard -o'
alias gets='xclip -selection secondary -o'
alias getp='xclip -selection primary -o'

shofont() {
    fc-list | grep -i sym | awk -F ':' '{print $2,"\n",$3,"\n---"}'
}

ei() {
    file=$1
    vim $(which $1)
}

www2() {
    if [ $# -gt 0 ];then
        w3m "www.duckduckgo.com/?q=$@"
    else
        w3m www.duckduckgo.com
    fi
}

pacsb() {
    package=${1:-vim}
    pacs ^$1 | grep -v '    ' | cut -d/ -f 2 | awk '{printf "%-30s %25s %20s\n", $1, $2, $3}'
}

setconsolefont() {
    size=${1:-24}
    setfont ter-u${size}n
}

mkcd() {
    mkdir -p "$1" && cd $1
}

RED=$(tput setaf 1)
GRN=$(tput setaf 148)
YEL=$(tput setaf 220)
BLU=$(tput setaf 33)
PUR=$(tput setaf 5)
CYA=$(tput setaf 6)
BLD=$(tput bold)
RST=$(tput sgr0)

branch() {
    branch=$(git branch  2>/dev/null | grep -e ^* | awk '{print $2}')
    if [ -n "$branch" ];then
        echo " [$branch]"
    fi
}

export PS1='\[$BLU\]\w\[$YEL\]\n\[$BLD\]\[$GRN\]\$\[$YEL\]$(branch) \[$YEL\]>\[$RST\] '

