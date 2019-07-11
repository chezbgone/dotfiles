setxkbmap -option caps:none
xmodmap -e "keycode 66 = section"

[[ -f ~/.fehbg ]] && source ~/.fehbg

compton &
xbindkeys

pulseeffects --gapplication-service &

export MOZ_USE_XINPUT2=1

exec i3
