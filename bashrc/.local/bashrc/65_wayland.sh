# setup wayland env

#River stuff
# see if we are using wayland
systemctl --user show-environment | grep -q river &&
	export XDG_CURRENT_DESKTOP=river
