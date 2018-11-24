#!/bin/sh

setxkbmap -option caps:none
xmodmap -e "keycode 66 = section"
