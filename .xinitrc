source ~/scripts/reset-keyboard.sh
source ~/scripts/wacom_setup.sh

[[ -f ~/scripts/fehbg.sh ]] && source ~/scripts/fehbg.sh

picom &
xbindkeys

# pulseeffects --gapplication-service &
xautolock -time 30 -locker "~/scripts/fuzzy-lock.sh" -corners 000- &

export MOZ_USE_XINPUT2=1

exec i3
