#!/usr/bin/env bash

if [[ ! -f notes/.notes_config ]]; then
	echo -e "\e[1;91m>>> Please create a .notes_config file <<<"
	exit 1
fi

source notes/.notes_config

if [[ ! -d "pset$1" ]]; then
	mkdir "pset$1"
fi

cd "pset$1"

writeupfile="${notesfileprefix}-pset$1-writeup.tex"
if [[ ! -f $writeupfile ]]; then
	if [[ ! -f "../writeup_template.tex" ]]; then
		echo -e "\e[1;91m>>> Please create a writeup_template.tex file <<<"
		exit 1
	fi
	cat ../writeup_template.tex > $writeupfile
fi

nvim $writeupfile
