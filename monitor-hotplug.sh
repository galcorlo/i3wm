#!/bin/bash

#logfile=/tmp/log.log
#exec > $logfile 2>&1


# Sets right perspective when monitor is plugged in
#cat /etc/udev/rules.d/80-monitor-hotplug.rules
#ACTION=="change", SUBSYSTEM=="drm", ENV{HOTPLUG}=="1", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/galcorlo/.Xauthority", RUN+="/home/galcorlo/.i3/monitor-hotplug.sh"

export DISPLAY=:0
export XAUTHORITY=/home/galcorlo/.Xauthority


PLUGGED=$(find /sys/class/drm/*/status -exec cat {} \; | grep -c '^connected')

if [ $PLUGGED -eq 1 ]; then
   # only the laptop monitor
   /usr/bin/xrandr --output eDP1 --primary --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI1 --off

elif [ $PLUGGED -eq 3 ]; then
   # three monitors connected (office environment)
   xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --mode 1920x1080 --pos 3840x0 --rotate left

fi
