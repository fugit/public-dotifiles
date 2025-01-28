#!/bin/bash

# passwords in pass need fqdn $HOME/.ssh/key_id
if [[ -v PASS_PATH ]]; then
	pass $PASS_PATH
	exit $?
fi

for I in \
	"$HOME/.ssh/id_rsa_pw" \
	"$HOME/.ssh/id_ed255519_pw" \
	"$HOME/.ssh/id_rsa_4096_pw"; do
	SSHKEYPATH=${I%;*}
	PASS=${I#*;}
	SSH_ASKPASS_REQUIRE="force" SSH_ASKPASS="$0" PASS_PATH="$PASS" ssh-add $SSHKEYPATH </dev/null
done
