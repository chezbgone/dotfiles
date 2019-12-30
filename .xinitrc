source ~/scripts/reset-keyboard.sh
source ~/scripts/wacom_setup.sh

[[ -f ~/.fehbg ]] && source ~/.fehbg

picom &
xbindkeys

pulseeffects --gapplication-service &
xautolock -time 15 -locker "~/scripts/fuzzy-lock.sh" -corners 000- &

export MOZ_USE_XINPUT2=1

exec i3
