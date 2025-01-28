#!/zsh/sh

#extract
function extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function def () {
    if [ -n $1 ] ; then
        sdcv $1 | less
    fi
}

function record () {
    ffmpeg -video_size 1600x900 -framerate 25 -f x11grab -i :0 output.mp4
}

function ddownload() {
    [ -n $1 ] && wget "http://media.readthedocs.org/pdf/$1/latest/$1.pdf"
}

function generate_structure(){
    if [ -n $1 ]; then
        mkdir $1 tests bin docs
        touch "${1}/__init__.py" "tests/${1}/__init.py__"
    fi
}

function count() {
  total=$1
  for ((i=total; i>0; i--)); do sleep 1; printf "Time remaining $i secs \r"; done
  echo -e "\a"
}

function config_search () {
    dir="$HOME/dotfiles/"
    $EDITOR $(find $dir -type f | grep -vi "node_module\|git\|.png\|jpeg\|jpg\|font" | fzf --history "$XDG_DATA_HOME/fzf/dotfiles.history.fzf")
}

function mcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function kebab () {
    echo "$@" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr -s '[:space:]' | tr ' ' '-'
}

function gpp() {
    git push || git push --set-upstream origin $(git branch --show-current)
}

function hn () {
    filename=$(hugo new "$1" | cut -f 1 -d" ")
    nvim $filename
}

