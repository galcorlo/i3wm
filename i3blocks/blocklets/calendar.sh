#!/bin/bash

# Check mouse event
case $BLOCK_BUTTON in
    3)
    gsimplecal
esac

date "+<span color='green'> </span>%a %d %b  <span color='red'></span><span color='#FFFFFF' font_weight='bold'>%H:%M</span>"

exit 0;
