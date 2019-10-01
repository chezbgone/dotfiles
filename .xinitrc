~/scripts/disable-caps-lock.sh

[[ -f ~/.fehbg ]] && source ~/.fehbg

compton &
xbindkeys

pulseeffects --gapplication-service &

export MOZ_USE_XINPUT2=1

exec i3
