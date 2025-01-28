# Editing

export EDITOR=$(type nvim vi vim nano pico emacs 2>/dev/null | sed 's/ .*$//;q')
alias q="$EDITOR -w -z"

export VISUAL="$EDITOR"
alias q="$EDITOR"
