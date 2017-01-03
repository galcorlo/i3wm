#!/usr/bin/env bash

if [ $(/usr/bin/pgrep -c i3lock\.sh$) -gt 1 ]; then
   exit 0
fi
 
icon="$HOME/.i3/Lock.gif"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
#convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
#convert "$tmpbg" -spread 6 "$tmpbg"
#convert "$tmpbg" -swirl 215 -spread "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% -spread 6 "$tmpbg"

#i3lock -t -e -f -i "$tmpbg"
# Turn the screen off after a delay.
#sleep 30; /usr/bin/pgrep -f i3lock\.sh$ && /usr/bin/xset dpms force off

revert() {
  xset dpms 0 0 0
}
trap revert SIGHUP SIGINT SIGTERM
xset +dpms dpms 30 30 30
i3lock -n -t -e -f -i "$tmpbg"
revert

