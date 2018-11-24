# dotfiles
alias config "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
complete -c config -w git		# config autocomplete inherit from git

export EDITOR="/usr/bin/nvim"

set fish_color_greeting 8888ff
set fish_color_name ffbb77
set fish_color_cwd 88ff88

set fish_greeting
#function fish_greeting
#	set_color $fish_color_greeting
#	printf "Hello "
#	set_color $fish_color_name
#	printf (whoami)
#	set_color $fish_color_greeting
#	printf "! You are filled with "
#	set_color $fish_color_name
#	printf "determination"
#	set_color $fish_color_greeting
#	printf ".\n"
#end

function fish_prompt
	set_color $fish_color_name
	printf (whoami)@(hostname)
	printf ' '
	set_color $fish_color_cwd
	printf (prompt_pwd)

	set_color normal
	printf '%s $ ' (__fish_git_prompt)
end

alias gogogo startx
alias emacs nvim # lol
alias vim nvim
alias vi nvim

function cs
	if [ -n $argv ]
		cd $argv
	end
	ls
end

alias latexmkpvc "latexmk -pvc"
alias latexmkpvcfast "latexmk -pvc -interaction=nonstopmode"

function pdf
	nohup zathura "$argv" >/dev/null 2>&1 &
end
