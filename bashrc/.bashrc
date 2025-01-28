# Where the magic happens.
export DOTFILES=~/dotfiles
export SOURCE=~/.local/bashrc

# Add binaries into the path
PATH=$DOTFILES/bin:$PATH
PATH=~/bin:${PATH}
export PATH

# Source all files in "source"
function src() {
	local file
	if [[ "$1" ]]; then
		source "$SOURCE/$1.sh"
	else
		for file in $SOURCE/*; do
			source "$file"
		done
	fi
}

# Run dotfiles script, then source.

#src 00_dotfiles
src
