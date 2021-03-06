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

abbr latexmkpvc "latexmk -pvc"
abbr latexmkpvcfast "latexmk -pvc -interaction=nonstopmode"
abbr latexmkpvcshellesc 'latexmk -pvc -latexoption="-shell-escape"'

abbr r ranger
abbr p sudo pacman

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

# opam configuration
#source /home/jason/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
