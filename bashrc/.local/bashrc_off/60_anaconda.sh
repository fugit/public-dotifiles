# added features for anaconda

# set PATH so it includes user's private bin if it exists
if [ -d ~/anaconda3/bin ] ; then
    PATH=~/anaconda3/bin:"${PATH}"
fi
export PATH
