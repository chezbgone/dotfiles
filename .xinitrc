setxkbmap -option caps:none
xmodmap -e "keycode 66 = section"

[[ -f ~/.fehbg ]] && source ~/.fehbg

compton --no-fading-openclose &

exec i3
