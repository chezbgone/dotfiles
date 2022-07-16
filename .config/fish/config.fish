#dotfiles
alias config "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
complete -c config -w git		# inherit config autocomplete from git

export EDITOR='nvim'
export PDFVIEWER='zathura'
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export TEXMFROOT="/usr/share/texmf-dist"
export TEXMFLOCAL="/usr/share/texmf-dist"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export CHKTEXRC="$XDG_CONFIG_HOME/chktex"
export AGDA_DIR="$XDG_CONFIG_HOME/agda"
set -eg fish_user_paths

set fish_color_greeting 8888ff
set fish_color_name ffbb77
set fish_color_cwd 88ff88

set fish_greeting

function fish_prompt
	set_color $fish_color_name
	#printf (whoami)@(hostname)
	#printf ' '
	set_color $fish_color_cwd
	printf (prompt_pwd)

	set_color normal
	printf '%s $ ' (__fish_git_prompt)
end

alias please 'eval sudo $history[1]'

alias diff colordiff

abbr bwsess 'export BW_SESSION=(bw unlock --raw)'

function cs
	if count $argv > /dev/null
		cd $argv
	end
	ls
end

abbr r ranger

function classnotes
	~/scripts/texnotes.sh
	cd notes
end

function notes
	~/scripts/texnotes_notes.sh
end

function todaynotes
	~/scripts/texnotes_day.sh
end

function sectionnotes
	~/scripts/texnotes_section.sh
end

function writeup
	~/scripts/writeup.sh $argv
end

function pdf
	nohup zathura "$argv" >/dev/null 2>&1 &
end

#complete -c pdf -w zathura	   # inherit zathura autocomplete from pdf

status --is-interactive; and pyenv init - --no-rehash | source
status --is-interactive; and pyenv virtualenv-init - | source

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore
set fish_cursor_visual block

if test "$TERM" = "dumb"
    function fish_title; end
end

# opam configuration
source /home/jason/.local/share/opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
