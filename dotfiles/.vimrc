" ===========================================================================
" VIM-PLUG
" ===========================================================================
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

" ===========================================================================
" VIM APPEARENCE SETTINGS
" ===========================================================================
syntax enable "turn on syntax highlighting
set enc=utf-8 "set character encoding
colo gruvbox "colorschemes
set bg=dark
let c_space_errors = 1 "highlight bad c cpaces
au BufRead,BufNewFile *.tbc set filetype=tbc "syntax recognition for Testboy cases
au BufRead,BufNewFile *.tbs set filetype=tbc
au BufRead,BufNewFile *.tbm set filetype=tbc

" ===========================================================================
" VIM BEHAVIOR SETTINGS
" ===========================================================================
"sounds
set noeb "no error bells
set bo=all "turn off bell for all events
"indenting/spacing
set expandtab "set tabs to use 4 spaces
set shiftwidth=4
set softtabstop=4
set nu "print line number
set nowrap "lines longer than window width will not wrap
set tw=80 "max width of text
set cc=+1 "set colorcolumn to 1 past max width
autocmd BufNewFile,BufRead,BufFilePost *.c,*.h set cindent " indent options
set cino+=:0 "c indent option: put switch and corresponding case at same indent level
set cino+=(0 "c indent option: line up with open-paren on next lineset
set cino+=W4 "c indent option: indent args by 4 when open-paren ends the line
set si "use smartindenting for non-cindent specified files
"searching
set ic "ignore case in search patterns
set is "show highlighting while typing a search command
set scs "override ignorecase if the search pattern contains upper case
set so=8 "keep 8 lindes to scroll when cursor gets off the screen
set ch=2 "number of lines to use for the command-line
"file creation/buffers
set noswf "don't use a swapfile for the buffer
set nobk "don't make a backup before overwriting a file
set hid "hide buffers when abandoned
"panes
set spr "split the new window to the right
"always open help in vertical window
cnoreabbrev <expr> help ((getcmdtype() is# ':' && getcmdline() is# 'help')?('vert help'):('help'))
cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('vert help'):('h'))
"mouse behavior
set mouse=a

" ===========================================================================
" VIM KEY MAPPINGS
" ===========================================================================
"
nnoremap <silent> <C-p> :setlocal t_ve= <CR>:GitFiles <CR>
"nnoremap <silent> <Leader>q :Rg<CR>
"setup ack shortcut, enter text to search
nmap <leader>q :Ack
"call ack when cursor on word in normal mode
nnoremap <leader>a :Ack! <cword><cr>
"call ack on anything selected in visual mode
vnoremap <leader>a y:Ack! "<C-r>""<CR>

nmap <F3> :bp<CR>:bd#<CR>
nmap <F4> :clo<CR>
nmap <F5> :CocRestart<CR>
nmap <F9> :NERDTreeToggle<CR><C-w>=
"toggle the tagbar on/off
nmap <F12> :TagbarToggle<CR>

imap jj <Esc>

vnoremap p "_dP
" ===========================================================================
" PLUG SETTINGS
" ===========================================================================
" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_buffer_jump = 1
let $FZF_DEAULT_OPTS='--reverse'
" AIR-LINE
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
"airline - tagbar
let g:airline#extensions#tagbar#enabled = 1
"NERDCOMMENTER
let g:c_syntax_for_h=1
let g:NERDCompactSexyComs=1
"Ack
cnoreabbrev Ack Ack!
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
"CoC
" Have K show documentation
nmap <silent>K :call <SID>show_documentation()<CR>
highlight Pmenu ctermbg=darkgray guibg=darkgray
" nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " .
        expand('<cword>')
    endif
endfunction
" <CR> confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Enable gitgutter
autocmd VimEnter * GitGutterEnable
" Coc GoTo
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" enabled semantic highlighting
let g:lsp_cxx_hl_use_text_props = 1
" WSL Clipboard
set clipboard+=unnamedplus
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
" Hack for C-p from WSL
execute "autocmd BufLeave * set t_ve=" . &t_ve
execute "autocmd VimLeave * set t_ve=" . &t_ve