rofiopt="YayPW\nCheckUpdates\nYayUpdate"
rofi=$(printf "$rofiopt" | rofi -dmenu -i -p "updates")
[ -z "$rofi" ] && exit

YAYPW=$(yay -Pw 2>/dev/stdout)
CU="$(
	checkupdates --nocolor &
	pacman -Qm | aur vercmp &
	wait
)"
case $rofi in
"YayPW") notify-send "$YAYPW" ;;
"CheckUpdates") notify-send "$CU" ;;
"YayUpdate") alacritty -e yay -Syu ;;
*) ;;
esac
