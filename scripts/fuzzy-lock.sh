#!/bin/sh -e

if pgrep i3lock > /dev/null
then
	echo "Already running"
	exit
fi

# Take a screenshot
scrot -o /tmp/screen_locked.png

# mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
mogrify -blur 0x6 -brightness-contrast -20 /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -e -i /tmp/screen_locked.png
