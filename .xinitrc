#!/bin/sh

source ~/scripts/reset-keyboard.sh &
source ~/scripts/wacom_setup.sh &

[[ -f ~/scripts/fehbg.sh ]] && source ~/scripts/fehbg.sh

picom &
xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config

# pulseeffects --gapplication-service &
# xautolock -time 30 -locker "~/scripts/fuzzy-lock.sh" -corners 000- &

export MOZ_USE_XINPUT2=1

xsetroot -cursor_name left_ptr
xrdb ~/.config/Xresources
dbus-update-activation-environment --all

dunst &
# exec xmonad
exec i3
