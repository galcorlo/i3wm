#!/bin/sh
# https://ebrnd.de/?p=501
# i3 on a laptop: quickly switch monitors

#xrandr --output VGA-0 --off --output DVI-0 --off --output LVDS --auto

####i3-nagbar -m "EBRND'S SUPER-COOL I3WM SCREEN CONFIG UTILITY" -t warning -f "System San Francisco Display Thin" \
####-b "FEINA" "xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --mode 1920x1080 --pos 3840x0 --rotate left" \
#####-b "LAPTOP" "xrandr --output DP1 --off --output DP2 --off" \
#####-b "LAPTOP + VGA mirror" "xrandr --output DP1 --off --output DP2 --auto --same-as eDP1" \
#####-b "LAPTOP + VGA" "xrandr --output DP1 --off --output DP2 --auto" \
#####-b "LAPTOP + DVI mirror" "xrandr --output DP2 --off --output DP1 --auto --same-as eDP1" \
#####-b "LAPTOP + DVI" "xrandr --output DP2 --off --output DP1 --auto" \

#	-b "LVDS + DVI"  "xrandr --output VGA-0 --off --output LVDS --auto --output DVI-0 --auto --right-of LVDS" \
#	-b "LVDS + VGA"  "xrandr --output DVI-0 --off --output LVDS --auto --output VGA-0 --auto --right-of LVDS" \
#	-b "VGA ONLY"    "xrandr --output LVDS --off --output DVI-0 --off --output VGA-0 --auto"
#sh ~/.fehbg



opcio1="LAPTOP"
accio1="xrandr --output DP1 --off --output DP2 --off"

opcio2="FEINA"
accio2="xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 3840x0 --rotate normal --output DP1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal"

opcio3="LAPTOP+DVI"
accio3="xrandr --output DP2 --off --output DP1 --auto"

opcio4="LAPTOP+DVI(mirror)"
accio4="xrandr --output DP2 --off --output DP1 --auto --same-as eDP1"

opcio5="LAPTOP+VGA(mirror)"
accio5="xrandr --output DP1 --off --output DP2 --auto --same-as eDP1"

opcio6="LAPTOP+VGA"
#accio6="xrandr --output DP1 --off --output DP2 --auto"
accio6="xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal"

while [  "$select" != "$opcio1" -a "$select" != "$opcio2" -a "$select" != "$opcio3" -a "$select" != "$opcio4" -a "$select" != "$opcio5" -a "$select" != "$opcio6" ]; do
    select=$(echo "$opcio1\n$opcio2\n$opcio3\n$opcio4\n$opcio5\n$opcio6" | dmenu -nb '#151515' -nf '#999999' -sb '#f00060' -sf '#000000' -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i -p "Configura el monitor: ")
    [ -z "$select" ] && exit 0
done

[ "$select" = "$opcio1" ] && eval $accio1 && exit 0
[ "$select" = "$opcio2" ] && eval $accio2 && exit 0
[ "$select" = "$opcio3" ] && eval $accio3 && exit 0
[ "$select" = "$opcio4" ] && eval $accio4 && exit 0
[ "$select" = "$opcio5" ] && eval $accio5 && exit 0
[ "$select" = "$opcio6" ] && eval $accio6 && exit 0


