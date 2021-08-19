#!/bin/sh

set_wallpaper()
{
    wallpaper="$(shuf -n1 -e ~/Franks/Wallpapers/*)"
    feh --bg-fill $wallpaper
    #notify-send "autoWallpaper.sh:" "  $(echo "$wallpaper" | sed 's/\/.*\///;s/\..*//')"
}

if [ $1 ]; then
	if [ $1 = "swap" ];then
    	set_wallpaper
    	exit
	elif [ $1 = "set" -a $2 ];then
        feh --bg-fill $2
		if [ $? -ne 0 ];then
			echo "invalid image"
		fi
		exit
	fi
fi

# verify if another instance is running
pid_previous_setWallpaper="$(ps x -o '%r %c' | grep setWallpaper | tr '\n' ' ' | awk 'NF>3{print $1}')"
if [ "$pid_previous_setWallpaper" ];then
	kill -9 "$pid_previous_setWallpaper"
fi

#useless animation
for f in $(shuf -n4 -e ~/.wallpaper/*)
do
    feh --bg-fill $f
    sleep 0.2s
done

while :; do
    set_wallpaper
    sleep 10m
done
