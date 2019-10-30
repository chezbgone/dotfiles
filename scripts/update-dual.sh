#! /usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/jason/.Xauthority

function connect(){
	notify-send "connect"
	xrandr --output HDMI2 --mode 1920x1080 --right-of eDP1
	source ~/.fehbg
	bluetoothctl connect 81:05:CA:7A:BB:58
	#xrandr | grep -q "HDMI2 connected" && pactl set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo
}

function disconnect(){
	notify-send "disconnect"
	xrandr --output HDMI2 --off
	#xrandr | grep -q "HDMI2 disconnected" && pactl set-card-profile 0 output:analog-stereo+2input:analog-stereo
}

xrandr | grep -q "HDMI2 connected" && connect || disconnect
