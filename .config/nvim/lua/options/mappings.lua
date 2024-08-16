vim.keymap.set({'n', 'x', 'o'}, 'H', '^')
vim.keymap.set({'n', 'x', 'o'}, 'L', '$')
vim.keymap.set({'n', 'x', 'o'}, 'gH', 'g^')
vim.keymap.set({'n', 'x', 'o'}, 'gL', 'g$')

vim.keymap.set('n', '<Tab>', '>>')
vim.keymap.set('n', '<S-Tab>', '<<')
vim.keymap.set('x', '<Tab>', '>gv')
vim.keymap.set('x', '<S-Tab>', '<gv')
vim.keymap.set('x', '>', '>gv')
vim.keymap.set('x', '<', '<gv')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set({'n', 'i'}, '<C-s>', function() vim.cmd.write() end )

vim.keymap.set('n', '<bslash><space>', function() vim.cmd('nohlsearch') end)

-- fix most recent spelling error to top suggestion
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- stop { and } from leaving navigation marks
-- https://vi.stackexchange.com/questions/11969
vim.keymap.set({'n', 'x'}, '}', function() vim.cmd('keepjumps normal! }') end )
vim.keymap.set({'n', 'x'}, '{', function() vim.cmd('keepjumps normal! {') end )

-- make <c-e> also work in insert mode
vim.keymap.set('i', '<C-e>', '<C-\\><C-o><C-e>')

-- disable annoying things
vim.keymap.set('n', 'q:', '<nop>')
vim.keymap.set({'n', 'i', 'v'}, '<F1>', '<nop>')
vim.keymap.set('n', 'K', '<nop>')

-- getting out of the terminal emulator
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

-- TODO: more
--
-- " Get syntax group name under cursor
-- nmap <F10> :call <SID>SynStack()<CR>
-- function! <SID>SynStack()
--   if !exists("*synstack")
--     return
--   endif
--   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
-- endfunc
-- 
-- nmap <F12> :NvimTreeToggle<CR>
-- 
-- " use <tab> and <S-tab> to navigate completion list
-- inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- " use <cr> to complete (even if nothing selected)
-- 
-- nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
-- nnoremap <Leader>c. :cd ..<CR>:pwd<CR>
-- 
-- " vim-sneak
-- let g:sneak#s_next = 1
-- nmap f <Plug>Sneak_f
-- nmap F <Plug>Sneak_F
-- nmap t <Plug>Sneak_t
-- nmap T <Plug>Sneak_T
-- nmap <Leader>f <Plug>Sneak_s
-- nmap <Leader>F <Plug>Sneak_S
-- xmap f <Plug>Sneak_f
-- xmap F <Plug>Sneak_F
-- xmap t <Plug>Sneak_t
-- xmap T <Plug>Sneak_T
-- xmap <Leader>f <Plug>Sneak_s
-- xmap <Leader>F <Plug>Sneak_S
-- omap f <Plug>Sneak_f
-- omap F <Plug>Sneak_F
-- omap t <Plug>Sneak_t
-- omap T <Plug>Sneak_T
-- omap <Leader>f <Plug>Sneakmappingsmap <Leader>F <Plug>Sneak_S
