#!/bin/bash
/home/galcorlo/go/bin/gopass ls --flat | /usr/bin/rofi -dmenu -i -p "gopass: "| /usr/bin/xargs --no-run-if-empty /home/galcorlo/go/bin/gopass show -c
