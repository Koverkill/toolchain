call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'

call plug#end()

syntax on

set guicursor=
set nohlsearch
set hidden
set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set cmdheight=2
set updatetime=50
set shortmess+=c
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=F
set textwidth=80
set colorcolumn=+1
set encoding=utf-8
set splitright
set background=dark

colorscheme gruvbox

let c_space_errors = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEAULT_OPTS='--reverse'

"always open help in vertical window
cnoreabbrev <expr> help ((getcmdtype() is# ':' && getcmdline() is# 'help')?('vert help'):('help'))
cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('vert help'):('h'))

" syntax recognition for Testboy cases
au BufRead,BufNewFile *.tbc set filetype=tbc
au BufRead,BufNewFile *.tbs set filetype=tbc

" indent options
autocmd BufNewFile,BufRead,BufFilePost *.c,*.h set cindent
" c indent option: put switch and corresponding case at same indent level
set cino+=:0
" c indent option: line up with open-paren on next line
" function_name(arg1, long_name_for_arg2,
"               long_name_for_arg3);
set cino+=(0
" c indent option: indent args by 4 when open-paren ends the line
" a_really_long_function_name_that_has_long_args(
"     next_arg_is_indented_4_spaces_from_function_start,
"     as_opposed_to_aligned_with_open_paren);
set cino+=W4

"============= Key Bindings ================

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>a :Rg<cword><CR>
nnoremap <silent> <Leader>q :Rg<CR>
vnoremap p "_dP

nmap <F4> :clo<CR>
nmap <F9> :NERDTreeToggle<CR><C-w>= 

"============= AIR-LINE ================
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"airline - tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>= <Plug>AirlineSelectNextTab

"airline - syntastic
let g:airline#extensions#syntastic#stl_format_err = 1
let g:airline#extensions#syntastic#stl_format_warn = 1

"airline - tagbar
let g:airline#extensions#tagbar#enabled = 1

"airline - ctrlp
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1

"============= NERDCOMMENTER ================
let g:c_syntax_for_h=1
