#!/usr/bin/env bash

#output="$(checkupdates-with-aur)"
output="$(
	checkupdates --nocolor &
	pacman -Qm | aur vercmp &
	wait
)"
if [ "$output" == '' ]; then
	text=''
else
	number="$(echo "$output" | wc -l)"
	text="$number "
fi

if (($number > 20)); then
	tooltip="$(echo "$output" | head -n 20 | sed -z 's/\n/\\n/g')"
	tooltip+='...'
else
	tooltip="$(echo "$output" | sed -z 's/\n/\\n/g')"
	tooltip=${tooltip::-2}
fi

echo "{\"text\":\""$text"\", \"tooltip\":\""$tooltip"\"}"
exit 0
