~/scripts/disable-caps-lock.sh
~/scripts/wacom_setup.sh

[[ -f ~/.fehbg ]] && source ~/.fehbg

picom &
xbindkeys

pulseeffects --gapplication-service &

export MOZ_USE_XINPUT2=1

exec i3
