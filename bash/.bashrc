# Load confidential info

# avoid bash to rename windows title ( usefull for OBS and i3 )
umask 077
unset PROMPT_COMMAND
# set a sound after command
#export PROMPT_COMMAND="aplay -q ~/Downloads/Saw.wav"

export PATH=$PATH:/home/krao/.local/bin
export LC_ALL=en_US.UTF-8
#export LC_ALL=fr_FR.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export BROWSER=qutebrowser
export EDITOR=vim
export GITHUBUSER=s-loiseau

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1 #export GIT_PS1_DESCRIBE_STYLE='contains'
export GIT_PS1_SHOWUPSTREAM='legacy git'

# use ;y (hint links yank) first in qutebrowse
alias ytdlmp3clip='cd ~/Music ; youtube-dl --extract-audio --audio-format mp3 $(getc)'

alias tshow='while true; do clear; transmission-remote -l ; sleep 5 ; done'
alias caly='cal -mwy'
alias cdc='cd ~/Code/'
alias tmux='tmux -2'
alias cdl='cd ~/CODE/LOVE'
alias figletshow="ls -R | fzf -m --preview \"echo 'Metroidéééééèèèèèçàù' | figlet -k -c -f {} | lolcat\""

alias ghs="git status -bs"
alias ghc='git commit -m "$(read)"'

# TRADUCTIONS
trs() {
    word="$*"
    trans :fr -show-original-dictionary N \
              -show-dictionary N \
              -show-original N \
              -show-languages N \
              -show-prompt-message N \
              -show-translation N \
              "$word"
}

## MAP THIS TO VIM

#alias shofont="fc-list | awk -F: '{printf \"%-95s %s\n%s\n\", \$1, \$3, \$2}'"
alias hdmi1='~/.screenlayout/1920hdmi2.sh; feh --randomize --bg-fill ~/Pictures/wallpaper/*'
alias hdmi2='~/.screenlayout/2560hdmi2.sh; feh --randomize --bg-fill ~/Pictures/wallpaper/*'
alias hdmioff='~/.screenlayout/nohdmi.sh; feh --randomize --bg-fill ~/Pictures/wallpaper/*'
alias hdmionly='~/.screenlayout/onlyhdmi19.sh; feh --randomize --bg-fill ~/Pictures/wallpaper/*'
alias rmux='if [ -z "$(tmux ls)" ]; then tmux ;else tmux attach -t 0 ; fi'
alias shodim='echo $COLUMNS $LINES'
alias shofontb='ls -rlth /usr/share/kbd/consolefonts/'
alias kcli='keepassxc-cli'
alias jup='jupyter notebook ~/CODE/NOTEBOOK'
alias ffeh='nohup feh -. -g 640x360 -xq &>/dev/null &'
alias gadd='git add'
alias gcom='git commit -m'
alias gdif='git diff'
alias ggra='git log --graph'
alias glog='git log --oneline --format="%Cgreen%h%Creset:%cr:%an:%s"|head -10|column -t -s:'
alias glogf='git log --oneline --format="%Cgreen%h%Creset:%cr:%an:%s"|column -t -s:'
alias gls='git ls-files'
alias gsho='git show'
alias gsta='git status -bs'

alias mcard='sudo mount /dev/sdb1 $HOME/card'

alias jj='ls -1l --color'
alias lf='ls -tl --color'
alias ll='ls -lGg'
alias lla='ls -atlGg --color'
alias lls='ls -rlthGg | lolcat'
alias ls='ls -1 -Gg --color --group-directories-first'

alias i3c='vi ~/.config/i3/config'
alias mine='java -jar ~/.minecraft/launcher.jar'

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

#alias subli='subliminal download -l en -l fr'

alias tstart='transmission-daemon -w ~/Videos'
alias tstop='transmission-remote --exit'

alias subl='subliminal download -l fr'

alias vi='vim'

alias wnetl='watch -n1 "netstat -4lnap 2>/dev/null | sort"'
alias wnets='watch -n1 "netstat -4nap 2>/dev/null | egrep \"ESTABLISHED|LISTEN\" | sort"'
alias netl='netstat -4lanp 2>/dev/null | sort'
alias nets='netstat -4nap 2>/dev/null | grep "ESTABLISHED" | sort'

alias www='w3m www.duckduckgo.com'


alias xreload='xrdb ~/.Xresources'

alias mountit='sudo mount -o rw /dev/sdb1 ~/sdmount'

alias ipa='ip -br -4 addr show'
alias iwq='iwconfig wlp1s0| grep Link'

alias wip='fipa |figlet -kf slant'

alias wips='fips | figlet -w 140 -kf colossal| lolcat'
alias canit='sudo nmap -sP $(fips) '
#alias canit2='canit | awk \'/report for/ {ip=$NF} /MAC Address/ {printf "%15s %s\n", ip, $0}\''

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

#trs() {
    # GIVE DICTIONARY INFO ON WORDS
    #clear
    #words="$*"
    #trans "$words" |grep -v -E "^$"| head -20
#}

trsf() {
    # GIVE DICTIONARY INFO ON WORDS
    clear
    words="$*"
    trans :fr "$words" | grep -v -E "^$" |head -20
}

branch() {
    branch=$(git branch  2>/dev/null | grep -e ^* | awk '{print $2}')
    if [ -n "$branch" ];then
        echo " [$branch]"
    fi
}

#alias ipa='ip -br -4 addr show'
fipa () {
# ipai show 193.49.5.6
nic=${1:-wlp1s0}
ip -br -4 addr show | grep UP | grep -w $nic | cut -d' ' -f 25 | sed 's#/.*##'
}

fips () {
ip -br -4 addr show | grep UP | cut -d' ' -f 25
}

export PRINTER=Canon-MG5300-series_18-0C-AC-33-80-90
# added by Anaconda3 4.1.1 installer

#no export TERM mess colors
#export TERM="xterm-256color"

RED=$(tput setaf 1)
GRN=$(tput setaf 148)
YEL=$(tput setaf 220)
BLU=$(tput setaf 33)
PUR=$(tput setaf 5)
CYA=$(tput setaf 6)
BLD=$(tput bold)
RST=$(tput sgr0)

# fix the test bellow failed
if [ -z $(branch) ];then
    export PS1='\[$BLU\]\w \[$YEL\]\n\[$BLD\]\[$GRN\]\$ \[$YEL\]>\[$RST\] '
else
    export PS1='\[$BLU\]\w\[$YEL\]\n\[$BLD\]\[$GRN\]\$$(branch)\[$YEL\]>\[$RST\] '
fi
# temp fix
export PS1='\[$BLU\]\w\[$YEL\]\n\[$BLD\]\[$GRN\]\$\[$RED\]$(branch) \[$YEL\]>\[$RST\] '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
