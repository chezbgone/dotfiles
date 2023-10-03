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

  augroup vimwiki_journal
    autocmd BufNewFile */journal/*.wiki execute "silent 0r !~/.config/nvim/bin/generate-vimwiki-journal-template '%'"
  augroup END

  augroup term
    autocmd TermOpen * setlocal nonumber norelativenumber | :DisableWhitespace
  augroup END
endif

" Because shift is hard to let go of okay
command! Wq wq
command! WQ wq
command! Qa qa
command! QA qa
command! W w
command! Q q
