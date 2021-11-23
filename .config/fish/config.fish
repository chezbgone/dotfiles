#dotfiles
alias config "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
complete -c config -w git		# inherit config autocomplete from git

export EDITOR='nvim'
export PDFVIEWER='zathura'
export PYENV_ROOT=$HOME/.pyenv
export TEXMFHOME=$HOME/.texmf
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

abbr vim nvim
abbr vi nvim

alias diff colordiff

abbr bwsess 'export BW_SESSION=(bw unlock --raw)'

function cs
	if count $argv > /dev/null
		cd $argv
	end
	ls
end

abbr r ranger
abbr p sudo pacman
abbr nn nvim .

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

# opam configuration
source /home/jason/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line blink
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
