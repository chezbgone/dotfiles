#!/bin/sh

TOGGLE=$HOME/scripts/.wacom_toggle

if [ ! -e $TOGGLE ]; then
	if [ -e $HOME/scripts/.HDMI2 ]; then
		touch $TOGGLE
		xsetwacom set "Wacom Intuos S Pen stylus" MapToOutput HDMI2
	fi
else
	rm $TOGGLE
	xsetwacom set "Wacom Intuos S Pen stylus" MapToOutput eDP1
fi
