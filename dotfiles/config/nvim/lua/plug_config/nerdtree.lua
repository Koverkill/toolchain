-- Nerdtree
-- start NERDTree when vim is started without argument
vim.cmd[[autocmd StdinReadPre * let s:std_in=1 |\
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif]]

-- Show hidden files
vim.cmd[[let NERDTreeShowHidden=1]]
