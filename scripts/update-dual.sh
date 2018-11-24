#!/usr/bin/sh

export DISPLAY=:0
export XAUTHORITY=/home/jason/.Xauthority

sleep 2

xrandr | grep -q "HDMI2 connected" && xrandr --output HDMI2 --mode 1920x1080 --right-of eDP1
xrandr | grep -q "HDMI2 connected" && pactl set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo
xrandr | grep -q "HDMI2 connected" && source ~/.fehbg

xrandr | grep -q "HDMI2 disconnected" && xrandr --output HDMI2 --off
xrandr | grep -q "HDMI2 disconnected" && pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
