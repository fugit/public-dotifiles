#!/bin/bash

# Script to create public dotfiles
### START VARS ###
# use pass to load name then find and replace...
#DROP_DIRS="pass ranger ssh"
NAME=$(pass fugit/name)
DROP_DIRS="ranger ssh"
REMOTE=$(git remote -v | grep fetch | sed -e 's/origin//' | sed -e 's/^[[:space:]]*//' | cut -d' ' -f1)
VERBOSE="true"
tmpdir=$(mktemp -d --tmpdir dotsclean-XXXX)
echo $tmpdir
### END VARS ###
### START GIT-ARCHIVE ###
if [ $VERBOSE == "true" ]; then
	echo "create bare repo or plain files"
	echo "REMOTE:$REMOTE"
	echo "git archive --format=tar --remote=$REMOTE master > $tmpdir/dotfiles-clean.tar"
fi
git archive --format=tar --remote=$REMOTE master >$tmpdir/dotfiles-clean.tar
cd $tmpdir/ || exit 1
tar xvf dotfiles-clean.tar || exit 1
rm $tmpdir/dotfiles-clean.tar || exit 1

### START GIT-ARCHIVE ###
echo "cleanup dots"
echo "cleanup git config"
sed -i 's/email.*/email/g;s/name.*/name/' $tmpdir/git/.config/git/config
echo "cleanup git submodule"
sed -i 's/url.*/url \= github.com\:example\/linux-desktop\/pass.git/' $tmpdir/.gitmodules
echo "dirs to remove"
for dir in $(echo $DROP_DIRS); do
	echo $dir
	find $tmpdir/ -maxdepth 1 -type d -name $dir -exec rm -rf '{}' \;
done
echo "cleanup my name from from repo"
for file in $(grep -Ril $NAME $tmpdir/*); do
	echo $file
	sed -i 's/'$NAME'/fugit/g' $file
done

### START CLEANUP ###
#delete tmpdir
echo "rm "$tmpdir""
#rm $tmpdir
### END CLEANUP ###
