if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cpp exe "read ~/.config/nvim/templates/".input("Template Name (c - competitive | b - basic | n - none): ").".cpp" |
                \ set syntax=cpp |
                \ set filetype=cpp |
                \ 0norm dd
    autocmd BufNewFile *.html read ~/.config/nvim/templates/skeleton.html |
                \ set syntax=html |
                \ set filetype=html |
                \ 0norm dd
    autocmd BufNewFile *.sh read ~/.config/nvim/templates/skeleton.sh |
                \ set syntax=sh |
                \ set filetype=sh |
                \ 0norm dd
    autocmd BufNewFile *.tex read ~/.config/nvim/templates/skeleton.tex |
                \ set syntax=tex |
                \ set filetype=tex |
                \ 0norm dd
  augroup END

  augroup numbertoggle
    autocmd!
    autocmd InsertLeave * if (!exists("b:NERDTree")) | set relativenumber | endif
    autocmd InsertEnter * if (!exists("b:NERDTree")) | set norelativenumber | endif
  augroup END


  if has_key(plugs, 'coc.nvim')
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
  endif

  augroup nerdtree_auto
    " automatically quit nerdtree if last
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " automatically open nerdtree if opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  augroup END

  augroup asy_ft
    autocmd!
    autocmd BufNewFile,BufRead *.asy set syntax=asy
  augroup END

  augroup vimwiki_journal
    autocmd BufNewFile */journal/*.wiki execute "silent 0r !~/.config/nvim/bin/generate-vimwiki-journal-template '%'"
  augroup END

  augroup term
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END


  augroup agda
    autocmd BufNewFile,BufRead *.lagda.md set filetype=agda.markdown

    " automatically quit if cornelis status window is last buffer
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:cornelis_window")) | q | endif

    function! CornelisLoadWrapper()
      if exists(":CornelisLoad") ==# 2
        CornelisLoad
      endif
    endfunction

    autocmd BufReadPre *.agda call CornelisLoadWrapper()
    autocmd BufReadPre *.lagda* call CornelisLoadWrapper()
  augroup END
endif

" Because shift is hard to let go of okay
command! Wq wq
command! WQ wq
command! W w
command! Q q
