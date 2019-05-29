setxkbmap -option caps:none
xmodmap -e "keycode 66 = section"

[[ -f ~/.fehbg ]] && source ~/.fehbg

compton &
xbindkeys

exec i3
