#!/usr/bin/env bash

if [[ ! -d notes ]]; then
	mkdir notes
fi

cd notes

if [[ ! -f .notes_config ]]; then
	read -p "Class name: " notesclassname
	read -p "Short name [classname]: " notesshortname
	read -p "File prefix [shortname]: " notesfileprefix
	read -p "Lecturer: " noteslecturer

	if [[ -z $notesshortname ]]; then
		notesshortname=$notesclassname
	fi

	if [[ -z $notesfileprefix ]]; then
		notesfileprefix=$notesshortname
	fi

	cat > .notes_config <<-EOF
		notesclassname="$notesclassname"
		notesshortname="$notesshortname"
		notesfileprefix="$notesfileprefix"
		noteslecturer="$noteslecturer"
	EOF
fi

source .notes_config

if [[ ! -f "${notesfileprefix}-notes.tex" ]]; then
	sed "s/\$notesclassname/$notesclassname/;
	     s/\$notesshortname/$notesshortname/;
	     s/\$notesfileprefix/$notesfileprefix/;
	     s/\$noteslecturer/$noteslecturer/" ~/Dropbox/keep/tex-templates/notes_template.tex > "${notesfileprefix}-notes.tex"
fi
