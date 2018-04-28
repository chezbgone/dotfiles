if has("autocmd")
  augroup templates
    autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
    autocmd BufNewFile *.cpp 0r ~/.config/nvim/templates/skeleton.cpp
  augroup END
endif
