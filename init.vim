" ==============================================================================
" vim-plug plugin manager
" ==============================================================================

" specify a directory for plugins
call plug#begin('~/.vim/plugged')

" smart cscope helper
    Plug 'brookhong/cscope.vim'
" fast ctrlp matcher based on python
    Plug 'FelikZ/ctrlp-py-matcher'
" get some cooler colors
    Plug 'flazz/vim-colorschemes'
" full path fuzzy file finder
    Plug 'kien/ctrlp.vim'
" search tool
    Plug 'mileszs/ack.vim'
" comment functions
    Plug 'preservim/nerdcommenter'
" file system explorer
    Plug 'preservim/nerdtree'
" tag browser
    Plug 'majutsushi/tagbar'
" ctag generator
    Plug 'szw/vim-tags'
" asynchronous system commands
    Plug 'tpope/vim-dispatch'
" git wrapper for vim
    Plug 'tpope/vim-fugitive'
" nice status/tabline 
    Plug 'vim-airline/vim-airline'

" initialize plugin system
" reload your config and use ':PlugInstall' to install plugins
call plug#end()

" ==============================================================================
" appearance settings
" ==============================================================================

    colorscheme gruvbox

    set background=dark
    set colorcolumn=+1
    set encoding=utf-8
    set number
    set textwidth=80

    syntax enable
" syntax recognition for Testboy cases
    au BufRead,BufNewFile *.tbc set filetype=tbc
    au BufRead,BufNewFile *.tbs set filetype=tbc

" ==============================================================================
" behavior settings
" ==============================================================================

" no windows chime or flash
    set belloff=all
" backup, writebackup, and swapfiles
    set nobackup
    set nowritebackup
    set noswapfile 
" set tabs
    set expandtab
    set shiftwidth=4
    set softtabstop=4
" Set completion to stop scanning included files
    setglobal complete-=i
    set complete-=i
" Reanimate paths
    set path+=src
    set path+=libraries
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
" vertical splits always go to the right
    set splitright
" jump to already opened buffer, if it is specified
    set switchbuf=useopen

" detect .h files as 'c' instead of 'cpp'.
    let g:c_syntax_for_h=1
" set ignore filetypes/paths we know we don't care about
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.i,*.o,*.s,*.lst,*.pbi*,*.pbi.cout
" use ripgrep for file grepping
    if executable("rg")
        set grepprg=rg\ --vimgrep\ --no-heading
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    endif
" fix case finding
    set ignorecase
    set smartcase
" weird ~ behavior
    set noundofile 

" ==============================================================================
" keymapping 
" ==============================================================================
" always open help in vertical window
    cnoreabbrev <expr> help ((getcmdtype() is# ':' && getcmdline() is# 'help')?('vert help'):('help'))
    cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('vert help'):('h'))

" call ack when cursor on word in normal mode
    nnoremap <leader>a :Ack! <cword><cr>
" call ack on anything selected in visual mode
    vnoremap <leader>a y:Ack! "<C-r>""<CR>
" setup ack shortcut, enter text to search
    nmap <leader>q :Ack 

    "delete currently selected buffer
    nmap <F3> :bp<CR>:bd#<CR>
    "close the current window
    nmap <F4> :clo<CR>
" refresh caches and tag/database files
    nmap <F5> :CtrlPClearCache<CR>:CtrlP<CR><Esc>:silent exec "!ctags -R --langmap=C:.c.h --languages=C --exclude=tools"<CR>:call CscopeUpdateDB()<CR>
" open or close nerdtree
    nmap <F9> :NERDTreeToggle<CR><C-w>=
" toggle the tagbar on/off
    nmap <F12> :TagbarToggle<CR> 

" useful snippets
    " quick ifndef statement for the beginning of header files
nmap <Leader>hs 0i#ifndef<Space><Esc>yy2po<Esc>jo<Esc>klcwendif<Space>/*<Esc>A<Space>*/<Esc>2k2bcwdefine<Esc>j
" capitalization helpers
    " capitalize word under cursor in normal mode
nmap <leader>u gUiw
    " capitalize whatever was just typed while still in insert mode
imap <C-u> <Esc>lmubgU`u`ui

" ==============================================================================
" plugin settings
" ==============================================================================

" ack
" - never jump to first ack result 
cnoreabbrev Ack Ack!
if executable('rg')
" use ripgrep for ack
    let g:ackprg = 'rg --vimgrep --no-heading -F -E UTF-8 -t c --no-sort-files -g !"tools/**" -g !"ewp/**" -g !"build/**" -g !"libraries/aws_iot/**" -g !"libraries/mbedtls/**" --type-add "c:*.tbc" --type-add "c:*.tbs"'
endif

" airline
" - display buffers when theres only one tab open
    let g:airline#extensions#tabline#enabled = 1
" - format how files are displayed in tab
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#buffer_idx_mode = 1

" - change the defaultfrome unicode symbols
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
" - airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

" - airline: ctrlp
    let g:airline#extensions#ctrlp#color_template = 'insert'
    let g:airline#extensions#ctrlp#color_template = 'normal'
    let g:airline#extensions#ctrlp#color_template = 'visual'
    let g:airline#extensions#ctrlp#color_template = 'replace'
    let g:airline#extensions#ctrlp#show_adjacent_modes = 1
" - airline: tabline
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

" cscope
if has("cscope")
    "point to the executable
    set csprg=C:/cygwin64/bin/cscope
    "quickfix settings
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    "cscope tag order, search cscope database before tags file
    set csto=1
endif
" - cscove 
    let g:cscope_cmd = 'C:/cygwin64/bin/cscope'
    let g:cscope_interested_files = '\.c$\|\.h$'
    let g:cscope_ignored_dir = 'tools$'
    let g:cscope_silent = 1
    let g:cscope_open_location = 1
    let g:cscope_auto_update = 0

" ctrlp
" - begin finding a root from the current working directory outsied of ctrlp
"   instead of from the directory of the current file.
    let g:ctrlp_working_path_mode = 'rw'
" - default to filename rather than filepath
    let g:ctrlp_by_filename = 1
" - set an external fuzzy matching function for CtrlP 
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" nerdcommenter
" - Add space after comment delimiters by default
    let g:NERDSpaceDelims = 1
" - Use compact sytax for multi-line comments
    let g:NERDCompactSexyComs = 1
" nerdtree
" - open nerdtree automatically if no files are specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" - close nerdtree automatically if nerdtree is last window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" - change arrows when viewing tree
    let NERDTreeDirArrowExpandable=">"
    let NERDTreeDirArrowCollapsible="v"
" - change default size to be a bit bigger
    let NERDTreeWinSize=40

" tags
" - generate tags on file saving
    let g:vim_tags_auto_generate = 0
" - allow for asynchronous tag generation
    let g:vim_tags_use_vim_dispatch = 0
" - main ctags generation
    let g:vim_tags_project_tags_command = "{CTAGS} -R --langmap=C:.c.h --languages=C --exclude=tools {DIRECTORY}"
