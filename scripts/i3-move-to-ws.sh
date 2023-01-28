#!/bin/sh

# https://faq.i3wm.org/question/6200/obtain-info-on-current-workspace-etc.1.html
CURRENT_WS=$(
  i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2 \
  | cut -d":" -f2
)

DESTINATION=$1
echo $DESTINATION

if grep --quiet $CURRENT_WS <<< "𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡𝟙𝟘"
then
  echo "bb"
  if [ "$DESTINATION" == "10" ]; then
    i3-msg move container to workspace 10:𝟙𝟘
  fi
  i3-msg move container to workspace $(echo -e "$DESTINATION:$(printf "\\\U%x\n" $((0x1d7d8+$DESTINATION)))")
else
  echo "notbb"
  i3-msg move container to workspace $DESTINATION
fi
