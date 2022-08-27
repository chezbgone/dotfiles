#!/usr/bin/env bash

function connect(){
	xrandr --output HDMI2 --mode 1920x1080 --right-of eDP1
	touch $HOME/scripts/.HDMI2
	#source ~/.fehbg
	#bluetoothctl connect 81:05:CA:7A:BB:58
	#xrandr | grep -q "HDMI2 connected" && pactl set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo
}

function disconnect(){
	xrandr --output HDMI2 --off
	rm -f $HOME/scripts/.HDMI2 # -f to not care if file doesnt exist
	#xrandr | grep -q "HDMI2 disconnected" && pactl set-card-profile 0 output:analog-stereo+2input:analog-stereo
}

xrandr | grep -q "HDMI2 connected" && connect
xrandr | grep -q "HDMI2 disconnected" && disconnect
