#!/bin/sh

# https://faq.i3wm.org/question/6200/obtain-info-on-current-workspace-etc.1.html
CURRENT_WS=$(
  i3-msg -t get_workspaces \
  | jq '.[] | select(.focused==true).name' \
  | cut -d"\"" -f2 \
  | cut -d":" -f2
)

WORKSPACE_INDEX=$1


if grep --quiet $CURRENT_WS <<< "𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡𝟙𝟘"
then
  if [ "$WORKSPACE_INDEX" == "10" ]; then
    i3-msg workspace 10:𝟙𝟘
    exit 0
  fi
  i3-msg workspace $(echo -e "$WORKSPACE_INDEX:$(printf "\\\U%x\n" $((0x1d7d8+$WORKSPACE_INDEX)))")
else
  i3-msg workspace $WORKSPACE_INDEX
fi
