#!/bin/bash

# Notifications handled by dunst. Launched via systemd
#killall mako
#mako &

killall waybar
waybar &

echo "$(date '+%Y%m%d%H%M%S') before waybar $?" >>/tmp/riverprocess.log

killall polkit-gnome-authentication-agent-1
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

echo "$(date '+%Y%m%d%H%M%S') before polkit-gnome $?" >>/tmp/riverprocess.log

killall nm-applet
nm-applet --indicator &

# Not using wlsunset
#killall wlsunset
#wlsunset -T 4500 &
brightnessctl set 2000

# Launch MEGA
megasync 2>/dev/null &

#SafeEyes
safeeyes -e &

# Checkout river-tag-overly (didnt like it... I just use the bar)
# river-tag-overly &

# River will send the process group of the init executable SIGTERM on exit.
riverctl default-layout rivertile &
exec rivertile -main-ratio 0.5 -view-padding 2 -outer-padding 2 &
for pad in $(riverctl list-inputs | grep -i touchpad); do
	riverctl input $pad events enabled
	riverctl input $pad tap enabled
done

echo "$(date '+%Y%m%d%H%M%S') before sway $?" >>/tmp/riverprocess.log

killall swaybg
WALLPAPER_FILE=$(ls ~/.local/Pictures/wallpaper | sort -R | tail -n 1)
WALLPAPER_PATH=~/.local/Pictures/wallpaper/
WALLPAPER=${WALLPAPER_PATH}${WALLPAPER_FILE}
swaybg -i $WALLPAPER -m fit &

echo "$(date '+%Y%m%d%H%M%S') swaybg $?" >>/tmp/riverprocess.log

pkill -f swayidle
swayidle -w \
	timeout 600 "swaylock -f -s fit -i $WALLPAPER;" \
	timeout 900 "wlopm --off \*;swaylock -F -s fit -i $WALLPAPER " resume "wlopm --on \*" \
	before-sleep "swaylock -f -s fit -i $WALLPAPER" &

echo "$(date '+%Y%m%d%H%M%S') swayidle $?" >>/tmp/riverprocess.log

# could be duplicate of stuff in init
#if command -v dbus-update-activation-environment >/dev/null; then
#	dbus-update-activation-environment XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE
#	echo "$(date '+%Y%m%d%H%M%S') dbus-update $?" >>/tmp/riverprocess.log
#fi

# Fix wayland screen sharing.
#   Found below post that sayed they needed to restart
# https://forum.artixlinux.org/index.php/topic,5268.0.html
export XDG_CURRENT_DESKTOP=river
systemctl --user restart xdg-desktop-portal-wlr
echo "$(date '+%Y%m%d%H%M%S') xdg-desktop-portal-wlr $?" >>/tmp/riverprocess.log

# updates removed from here...
#~/.config/scripts/updates.sh
