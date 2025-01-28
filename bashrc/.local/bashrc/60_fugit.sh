# added features for fugit

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ]; then
	PATH=~/bin:"${PATH}"
fi
if [ -d ~/data/commands ]; then
	PATH="${HOME}/data/commands:${PATH}"
fi
if [ -d ~/.local/bin ]; then
	PATH="${HOME}/.local/bin:${PATH}"
fi
if [ -d /opt/cisco/secureclient/bin ]; then
	PATH="/opt/cisco/secureclient/bin:${PATH}"
fi
if [ -d ~/.bash-my-aws/lib/ ]; then
	for f in ~/.bash-my-aws/lib/*-functions; do source $f; done
fi
export PATH

# Setup my temp directory
if [[ -O /home/$USER/tmp && -d /home/$USER/tmp ]]; then
	TMPDIR=/home/$USER/tmp
else
	# You may wish to remove this line, it is there in case
	# a user has put a file 'tmp' in there directory or a
	rm -rf /home/$USER/tmp 2>/dev/null
	mkdir -p /home/$USER/tmp
	TMPDIR=$(mktemp -d /home/$USER/tmp/XXXX)
fi

[ -f /usr/bin/nvim ] && alias vi=nvim
TMP=$TMPDIR
TEMP=$TMPDIR
export TMPDIR TMP TEMP

# Alias and fucntions
[ -f /usr/bin/nvim ] && alias vi=nvim
[ -f /usr/bin/bat ] && alias cat=bat
[ -f /usr/bin/tbsm ] && alias tb1="/usr/bin/tbsm 1"

## Steam Games
### Death Must Die
[ -f /usr/bin/steam ] && alias steam-dmd="steam steam://rungameid/2334730"
[ -f /usr/bin/steam ] && alias steam-vph="steam steam://rungameid/1794680"
[ -f /usr/bin/steam ] && alias steam-whc="steam steam://rungameid/1611910"

# function for ssh to yaml file names.
#sshy() { t=$(echo "${1}" | sed 's/\.yaml//') && ssh $t; }
#ssh() { t=$(echo "${1}"| sed 's/\.yaml//') && /usr/bin/ssh $t ; }

PAGER=less

export PAGER
