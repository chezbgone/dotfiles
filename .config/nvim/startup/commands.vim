if has("autocmd")
	augroup templates
		autocmd BufNewFile *.cpp exe "0r ~/.config/nvim/templates/".input("Template Name (c - competitive | b - basic | n - none): ").".cpp" |
			\ set syntax=cpp |
			\ set filetype=cpp
		autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html |
			\ set syntax=html |
			\ set filetype=html
		autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh |
			\ set syntax=sh |
			\ set filetype=tex
		autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex |
			\ set syntax=tex |
			\ set filetype=tex
	augroup END

	augroup numbertoggle
		autocmd!
		autocmd InsertLeave * if (!exists("b:NERDTree")) | set relativenumber | endif
		autocmd InsertEnter * if (!exists("b:NERDTree")) | set norelativenumber | endif
	augroup END

	" automatically quit nerdtree if last
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

	if has_key(plugs, 'coc.nvim')
		" Highlight the symbol and its references when holding the cursor.
		autocmd CursorHold * silent call CocActionAsync('highlight')
	endif

	" automatically open nerdtree if opening a directory
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

	augroup asy_ft
		autocmd!
		autocmd BufNewFile,BufRead *.asy set syntax=asy
	augroup END
endif
