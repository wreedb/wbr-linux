#!/bin/bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -c $XDG_CONFIG_HOME/$DESKTOP_SESSION/polybar.ini 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

pkill dunst; dunst &
