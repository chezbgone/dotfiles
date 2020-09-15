#!/usr/bin/env bash

if [[ ! -f .notes_config ]]; then
	echo -e "\e[1;91m>>> Please create a .notes_config file <<<"
	exit 1
fi

source .notes_config

todaysfile="${notesfileprefix}-$(date +%y%m%d)"
if [[ ! -f "${todaysfile}.tex" ]]; then
	echo "creating file for section"
	notesclassname=$notesclassname \
	notesshortname=$notesshortname \
	noteslecturer=$noteslecturer \
	todaysdate=$(date +"%B %d, %Y") \
	envsubst < ~/Dropbox/Keep/TeX_Templates/notes_section_template.tex > "${todaysfile}.tex"
fi

if [[ -z $(grep "${todaysfile}" "${notesfileprefix}-notes.tex") ]]; then
	sed --in-place "s/% insert here/\\\input{${todaysfile}}\n&/" "${notesfileprefix}-notes.tex"
fi

nvim -o "${notesfileprefix}-notes.tex" "${notesfileprefix}-$(date +%y%m%d).tex"
