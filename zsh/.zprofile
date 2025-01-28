# add scripts folder to PATH
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin:$HOME/.local/bin:$HOME/.yarn/bin"

# XDG defaults
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_STATE_HOME="$HOME/.local/state"

# disable auto title (for tmuxp)
export DISABLE_AUTO_TITLE='true'

# set gnupg home
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# get rid of gem dir in $HOME
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem

# set Xauthority home
# export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

##### XDG OVERRIDES #####
# avoid aspell files in $HOME
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_CONFIG_HOME/aspell/en.pws; repl $XDG_CONFIG_HOME/aspell/en.prepl"

# set vscode home
export VSCODE_EXTENSIONS="${XDG_DATA_HOME:-~/.local/share}/vscode-oss/extensions"

# set vagrant home
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases

# set aws home
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# set wget home
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# avoid error.log in ~/.ncmpcpp
export ncmpcpp_directory='$HOME/.config/ncmpcpp'

# set Golang home
export GOPATH="$XDG_DATA_HOME"/go

# set elinks config home
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks

# set OpenSSL ran file home
export RANDFILE="$XDG_STATE_HOME/openssl/.rnd"

# add dictionaries path
export STARDICT_DATA_DIR="$XDG_DATA_HOME/stardict"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

# RTV
export RTV_BROWSER='urlportal'

# default programs
export BROWSER='firefox'
export EDITOR='nvim'
export FILE='vu'
export READER="zathura"
export TERMINAL='alacritty'
# export TERMINAL='st' # Removed it because of cursor color problems

# Change sqlite_history
export SQLITE_HISTORY=$XDG_STATE_HOME/sqlite/history

export _Z_DATA="$XDG_DATA_HOME/z"

# Change zhistory and compinit to use cache folder
export HISTFILE="$XDG_STATE_HOME"/zsh/history
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Start graphical server on tty1 if not already running.
eval `keychain --eval --agents ssh id_rsa`
if [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null;
then
    exec startx
fi
