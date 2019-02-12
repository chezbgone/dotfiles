if has("autocmd")
	augroup templates
		autocmd BufNewFile *.cpp exe "0r ~/.config/nvim/templates/".input("Template Name (c - competitive | b - basic | n - none): ").".cpp"
		autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
		autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
		autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
	augroup END

	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
	augroup END

	" automatically quit nerdtree if last
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
