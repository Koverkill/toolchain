"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/lightline.nvim
source ~/.config/nvim/plugins/lightline-bufferline.nvim
source ~/.config/nvim/plugins/tokyonight.nvim
source ~/.config/nvim/plugins/floaterm.nvim
source ~/.config/nvim/plugins/vim-gitbranch.nvim
source ~/.config/nvim/plugins/auto-pairs.nvim
source ~/.config/nvim/plugins/nerdtree.nvim
source ~/.config/nvim/plugins/nerdcommenter.nvim
source ~/.config/nvim/plugins/fzf.nvim
source ~/.config/nvim/plugins/vim-devicons.nvim
source ~/.config/nvim/plugins/ack.nvim

call plug#end()

"-------------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------------
set background=dark
colorscheme tokyonight
set number
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
set list
set listchars=trail:*
" Make background look nice with acrylic terminal setting
hi Normal guibg=NONE ctermbg=NONE
"-------------------------------------------------------------------------------
" Key Maps
"-------------------------------------------------------------------------------
let mapleader = " "
let maplocalleader = " "

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
" Allow gf to open non-existent files
map gf :edit <cfile><cr>

nmap <F3> :bp<CR>:bd#<CR>
nmap <F4> :clo<CR>
