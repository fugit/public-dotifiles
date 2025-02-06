# shellcheck shell=bash
# shellcheck source=/home/fugit/.keychain/archnanofu1-sh
# keychain setup

# linux check for non-gui term
# check if rsa key loaded if so skip...
ssh-add -l | grep id_rsa_pw -q
ASKPASS="$?"
# If already loaded skip...
if [ "$ASKPASS" != "0" ]; then
	[[ "$TERM" != "linux" ]] &&
		pass news/nytimes >>/dev/null
	[[ "$TERM" != "linux" ]] &&
		[[ -f "$HOME/.local/libs/ssh-add-pass.sh" ]] &&
		$HOME/.local/libs/ssh-add-pass.sh
	# kde5 check for dumb term
	[[ "$TERM" != "dumb" ]] &&
		[[ "$TERM" != "linux" ]] &&
		[[ -f "$HOME/.ssh/id_rsa_pw" ]] &&
		keychain id_rsa_pw
	#[[ "$TERM" != "dumb" ]] &&
	#	[[ -f "$HOME/.ssh/id_rsa_4096_pw" ]] &&
	#	keychain id_rsa_4096_pw
	# load keychain; comment for shellcheck
	[[ -f $HOME/.keychain/$HOSTNAME-sh ]] &&
		source "$HOME/.keychain/$HOSTNAME-sh"
# END keychain
fi
