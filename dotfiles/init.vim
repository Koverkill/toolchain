"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/lightline-bufferline.vim
source ~/.config/nvim/plugins/tokyonight.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/vim-gitbranch.vim
source ~/.config/nvim/plugins/auto-pairs.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/ultisnips.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/vim-devicons.vim
source ~/.config/nvim/plugins/ack.vim

call plug#end()

"-------------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------------
set background=dark
colorscheme tokyonightstorm
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
