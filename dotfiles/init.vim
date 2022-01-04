"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

source ~/.vim/plugins/lightline.vim
source ~/.vim/plugins/lightline-bufferline.vim
source ~/.vim/plugins/papercolor-theme.vim
source ~/.vim/plugins/floaterm.vim
source ~/.vim/plugins/vim-gitbranch.vim
source ~/.vim/plugins/auto-pairs.vim
source ~/.vim/plugins/nerdtree.vim
source ~/.vim/plugins/nerdcommenter.vim
source ~/.vim/plugins/ultisnips.vim
source ~/.vim/plugins/coc.vim
source ~/.vim/plugins/fzf.vim
source ~/.vim/plugins/vim-devicons.vim

call plug#end()

"-------------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------------
set background=dark
colorscheme PaperColor
set number
set relativenumber 
set mouse=a
set expandtab 
set shiftwidth=4
set softtabstop=4
set splitright
set scrolloff=8
set noswapfile
set showtabline=2
set updatetime=300
set colorcolumn=80
" Make background look nice with acrylic terminal setting
hi Normal guibg=NONE ctermbg=NONE
" clipboard workaround for WSL
set clipboard+=unnamedplus
filetype plugin on
let g:clipboard = {
            \   'name': 'win32yank-wsl',
            \   'copy': {
            \      '+': 'win32yank.exe -i --crlf',
            \      '*': 'win32yank.exe -i --crlf',
            \    },
            \   'paste': {
            \      '+': 'win32yank.exe -o --lf',
            \      '*': 'win32yank.exe -o --lf',
            \   },
            \   'cache_enabled': 0,
            \ }

"-------------------------------------------------------------------------------
" Key Maps
"-------------------------------------------------------------------------------
let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
" Allow gf to open non-existent files
map gf :edit <cfile><cr>

nmap <F3> :bp<CR>:bd#<CR>
nmap <F4> :clo<CR>
