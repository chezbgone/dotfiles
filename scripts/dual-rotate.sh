#!/bin/sh

xrandr | grep -q "HDMI2 .* left (" && xrandr --output HDMI2 --right-of eDP1 --rotate normal && source ~/.fehbg && exit 0

xrandr | grep -q "HDMI2 .*0 (" && xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate left && xrandr --output eDP1 --mode 1920x1080 --pos 0x420 && source ~/.fehbg
