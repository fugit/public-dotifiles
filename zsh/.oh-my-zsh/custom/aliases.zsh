#!/usr/bin/env zsh

### Generic programs shortcuts: ###
alias a="calcurse -a -t"
alias shop='calcurse -C "$XDG_CONFIG_HOME"/calcurse -D "$XDG_DATA_HOME"/calcurse/shop'
# alias email="thunderbird -ProfileManager"
alias email="neomutt"
alias nf="clear && neofetch"
alias td="transmission-daemon"
alias docker="podman"
alias k="kubectl"
alias hs="hugo server -Dw"


### command-improved ###
alias mkdir="mkdir -pv"
alias du='du -kh'
alias df='df -kTh'
alias free='free -h'
alias cal='cal -3m'
alias vim='nvim'
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

alias calcurse='calcurse -C "$XDG_CONFIG_HOME"/calcurse -D "$XDG_DATA_HOME"/calcurse'

alias gpg='gpg --homedir "$XDG_DATA_HOME"/gnupg'
alias gpg2='gpg'
# alias date='date "+%A, %B %d, %Y [%T]"'
alias walrand='wal --theme random && echo -e "colors = $(cat ~/.cache/wal/colors.json)" > ~/.config/browser/colors.json'
alias walrandl='wal --theme random_light && echo -e "colors = $(cat ~/.cache/wal/colors.json)" > ~/.config/browser/colors.json'

#Privilege
alias p="sudo pacman"
alias scat="sudo cat"
alias svim="sudo vim"
alias srm="sudo rm"

### My aliases ###
 #youtube-dl
alias mp3='yt-dlp -ic -x --audio-format=mp3'
alias ytlow='yt-dlp -ic -f 17'
alias yt='yt-dlp -ic -f 18'
alias ythigh='yt-dlp -ic'
  #python server
alias py2serv="python -m SimpleHTTPServer"
alias py3serv="python3 -m http.server"
alias pyserv="py3serv"

# Info aliases
alias battery="cat /sys/class/power_supply/BAT0/status /sys/class/power_supply/BAT0/capacity* | tr '\n' ' : '"
alias weather="curl wttr.in"

alias tf="terraform"
