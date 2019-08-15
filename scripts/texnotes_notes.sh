#!/usr/bin/env bash

if [[ ! -f .notes_config ]]; then
	echo -e "\e[1;91m>>> Please create a .notes_config file <<<"
	exit 1
fi

source .notes_config

nvim "${notesfileprefix}-notes.tex"
