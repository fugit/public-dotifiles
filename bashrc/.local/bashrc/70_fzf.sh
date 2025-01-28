### FZF
# default location moved to dotfiles.
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setup fzf
# ---------

# Auto-completion
# ---------------
if [[ -f /usr/share/fzf/completion.bash ]]; then
	[[ $- == *i* ]] && source /usr/share/fzf/completion.bash 2>/dev/null
fi

# Key bindings
# ------------
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
	[[ $- == *i* ]] && source /usr/share/fzf/key-bindings.bash 2>/dev/null
fi

# Below works after install bash-completion...
# Auto-completion without **
if [[ -f ~/.local/libs/fzf/fzf-bash-completion.sh ]]; then
	[[ $- == *i* ]] && source ~/.local/libs/fzf/fzf-bash-completion.sh 2>/dev/null
	bind -x '"\t": fzf_bash_completion'
fi

if [[ -f ~/.local/libs/fzf/fzf-marks.plugin.bash ]]; then
	source ~/.local/libs/fzf/fzf-marks.plugin.bash 2>/dev/null
fi

# Alias
[ -f /usr/bin/bat ] && alias fzfp='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

#FZF_COMPLETION_TRIGGER='**'
#export $FZF_COMPLETION_TRIGGER
