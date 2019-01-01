if has("autocmd")
	augroup templates
		autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
		autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
		autocmd BufNewFile *.cpp exe "0r ~/.config/nvim/templates/".input("Template Name (c - competitive | b - basic | n - none): ").".cpp"
	augroup END

	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
	augroup END
endif
