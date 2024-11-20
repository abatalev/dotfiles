#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

MON_COUNT=$(xrandr --listmonitors | grep  "^ " | wc -l)

if [ $HOST == "archlinux" ]; then
if [ $MON_COUNT == 2 ]; then
        xrandr --output DP-2 --left-of DP-0
    feh --no-fehbg --bg-scale wallpaper-dp-0.jpg wallpaper-dp-2.jpg
    else 
        feh --no-fehbg --bg-scale wallpaper-dp-0.jpg
    fi
elif
    if [ $MON_COUNT == 2 ]; then
        xrandr --output DP-1 --left-of eDP-1
        feh --no-fehbg --bg-scale wallpaper-islands.jpg wallpaper-street.jpg
elif [ $MON_COUNT == 3 ]; then
        xrandr --output DP-3 --right-of eDP-1
        xrandr --output DP-1 --left-of eDP-1
    feh --no-fehbg --bg-scale wallpaper-islands.jpg wallpaper-street.jpg wallpaper-forest.jpg   
else 
    feh --no-fehbg --bg-scale wallpaper-islands.jpg
fi
fi

#
redshift -l $(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | jq -r '"\(.location.lat):\(.location.lng)"') &

#
xbindkeys

#setxkbmap ru &
picom -f &
exec bspwm
