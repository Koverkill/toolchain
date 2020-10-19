" ============================================================================
"   ==================== VUNDLE PLUGIN MANAGER SETTINGS ====================
" ============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" optional plugins below
Plugin 'powerline/powerline-fonts'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jacoborus/tender.vim'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'tomasiser/vim-code-dark'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-rooter'
Plugin 'majutsushi/tagbar'
Plugin 'brookhong/cscope.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'szw/vim-tags'
Plugin 'tpope/vim-fugitive'
Plugin 'jceb/vim-orgmode'
"Plugin 'valloric/youcompleteme'
"Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set shell=powershell
"set shellcmdflag=-command"

" ============================================================================
"   ========================= LOAD DEFAULT SETTINGS ========================
" ============================================================================
if v:progname =~? "evim"
  finish
endif
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif
if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" GVim settings only, border fix hack
if has("gui_running")
    "FixGVimBorder
    if $VIM_FULLSCREEN_DLL_FIX
        " dll already loaded, do nothing
    else
        " load the dll fix

        " auto detects background color and uses it on the border
        " this works most of the time
        "autocmd GUIEnter * call libcall("loadfixgvimborder.dll", "LoadFixGVimBorderWithoutAutocentering", 0)

        " permanent solution - setup border color by hand using hex format
        " this is recomended solution
        "autocmd GUIEnter * call libcall("loadfixgvimborder.dll", "LoadFixGVimBorder", "#4C4A48")
        autocmd GUIEnter * call libcall("loadfixgvimborder.dll", "LoadFixGVimBorderWithoutAutocentering", "#4C4A48")
        let $VIM_FULLSCREEN_DLL_FIX = 1
    endif
endif

" ============================================================================
"   ======================== VIM BEHAVIOR SETTINGS ========================
" ============================================================================

"============ PASSIVE SKILLZ ============

" setup whitespace characters for display with :set list (nolist to un-display)
"<set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set hidden
" remove all gui elements, no toolbar or scrollbars
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b
set guioptions-=F

" no windows chime or flash
set belloff=all

" backup, writebackup, and swapfiles
set nobackup
set nowritebackup
set noswapfile 

" Save backup files in temp dir
" set swapfile
" set dir=~/tmp
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
"use code folding
set foldmethod=indent   
set foldnestmax=10
set foldlevel=6
set nofoldenable
"open vim expanded to full screen
au GUIEnter * simalt ~x
"vertical splits always go to the right
set splitright
"jump to already opened buffer, if it is specified
set switchbuf=useopen
"max columns line
set textwidth=80
set colorcolumn=+1
"highlight crap space
let c_space_errors = 1
"set tabs to use 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4
" detect .h files as 'c' instead of 'cpp'.  Useful for plugins that depend on
" filetype (NERD_commenter is the one I care about)
let g:c_syntax_for_h=1
"set ignore filetypes/paths we know we don't care about
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.i,*.o,*.s,*.lst,*.pbi*,*.pbi.cout
"use ripgrep for file grepping
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" cscope settings
if has("cscope")
    "point to the executable
    set csprg=C:/cygwin64/bin/cscope
    "quickfix settings
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    "cscope tag order, search cscope database before tags file
    set csto=1
endif

filetype plugin on

set ignorecase
set smartcase

"============ ACTIVE SKILLS ============

"cscope mappings
    "call interactive cscope
nmap <leader>S :call CscopeFindInteractive(expand('<cword>'))<CR>
    "call cscope with the corresponding type
nmap <leader>ss :call CscopeFind('s',expand('<cword>'))<CR>
nmap <leader>sc :call CscopeFind('c',expand('<cword>'))<CR>
nmap <leader>sd :call CscopeFind('d',expand('<cword>'))<CR>
nmap <leader>sf :call CscopeFind('f',expand('<cword>'))<CR>
nmap <leader>st :call CscopeFind('t',expand('<cword>'))<CR>
    "setup cscope shortcut, enter text to search
nmap <leader>w :call CscopeFind('s','')<Left><Left>

"always open help in vertical window
cnoreabbrev <expr> help ((getcmdtype() is# ':' && getcmdline() is# 'help')?('vert help'):('help'))
cnoreabbrev <expr> h ((getcmdtype() is# ':' && getcmdline() is# 'h')?('vert help'):('h'))

"window width manipulation
set winaltkeys=no
nnoremap <A-,> :2winc <<CR>
nnoremap <A-.> :2winc ><CR>

"call ack when cursor on word in normal mode
nnoremap <leader>a :Ack! <cword><cr>
"call ack on anything selected in visual mode
vnoremap <leader>a y:Ack! "<C-r>""<CR>
"setup ack shortcut, enter text to search
nmap <leader>q :Ack 

"capitalization helpers
    "capitalize word under cursor in normal mode
nmap <leader>u gUiw
    "capitalize whatever was just typed while still in insert mode
imap <C-u> <Esc>lmubgU`u`ui

"function key mappings
    "save current file
nmap <F2> :w<CR>
    "delete currently selected buffer
nmap <F3> :bp<CR>:bd#<CR>
    "close the current window
nmap <F4> :clo<CR>
    "refresh caches and tag/database files
nmap <F5> :CtrlPClearCache<CR>:CtrlP<CR><Esc>:silent exec "!ctags -R --langmap=C:.c.h --languages=C --exclude=tools"<CR>:call CscopeUpdateDB()<CR>
"nmap <F5> :CtrlPClearCache<CR>:cs kill 0<CR>:silent exec "!C:/cygwin64/bin/cscope -Rbquv"<CR>:silent exec "!ctags -R --langmap=C:.c.h --languages=C --exclude=tools"<CR>:cs add cscope.out<CR>
    "Build w/IAR
"nmap <F6> :silent exec "!IarBuild harmoneon.ewp -build engineering -log info -parallel 4"<CR>
nmap <F6> :silent exec "!IarBuild C:/CODE/Reanimate1/ewp/harmoneon.ewp -make engineering -log info -parallel 16"<CR>
    "close fold at this indent
nmap <F7> za 
    "open fold at this indent
nmap <F8> zo 
    "open NERDTree
nmap <F9> :NERDTreeToggle<CR><C-w>= 
    "toggle cscope location list
nmap <F10> :call ToggleLocationList()<CR> 
    "close the window below the active window
nmap <F11> <C-W>j<F4> 
    "toggle the tagbar on/off
nmap <F12> :TagbarToggle<CR> 

"useful snippets
    " quick ifndef statement for the beginning of header files
nmap <Leader>hs 0i#ifndef<Space><Esc>yy2po<Esc>jo<Esc>klcwendif<Space>/*<Esc>A<Space>*/<Esc>2k2bcwdefine<Esc>j

" weird ~ behavior
set noundofile 
" ============================================================================
"   ======================== VIM APPEARANCE SETTINGS =======================
" ============================================================================

" enable syntax highlighting
syntax enable
" enable dark background, this affects some colorschemes
set background=dark
" font, must be a patched powerline font for your statusline to look good
set guifont=DejaVu_Sans_Mono_for_Powerline:h11
" encoding...
set encoding=utf-8
" display line numbers
set number
" syntax recognition for Testboy cases
au BufRead,BufNewFile *.tbc set filetype=tbc
au BufRead,BufNewFile *.tbs set filetype=tbc
"turn relative line numbers on 

"=========== CLEAR LAST SEARCH ==========
"nnoremap <esc> :noh<return><esc>
"============ COLORSCHEMES =============

let g:solarized_termcolors=256
let g:solarized_contrast="high"
"colorscheme solarized

"colorscheme luna

"colorscheme hornet

"colorscheme vivacious

"colorscheme headache

"colorscheme badwolf

"colorscheme hybrid

"colorscheme tender

"colorscheme hybrid_material
"let g:airline_theme='hybridline'

"colorscheme atom-dark
"let g:airline_theme='codedark'

"colorscheme Monokai
"let g:airline_theme='molokai'

"colorscheme PaperColor

"colorscheme wombat

colorscheme gruvbox
"=======================================

" ============================================================================
"   ========================= VIM PLUGIN SETTINGS ==========================
" ============================================================================

"============== VIM-TAGS ===============
let g:vim_tags_auto_generate = 0
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_project_tags_command = "{CTAGS} -R --langmap=C:.c.h --languages=C --exclude=tools {DIRECTORY}"

"=============== CSCOVE ================
let g:cscope_cmd = 'C:/cygwin64/bin/cscope'
let g:cscope_interested_files = '\.c$\|\.h$'
let g:cscope_ignored_dir = 'tools$'
let g:cscope_silent = 1
let g:cscope_open_location = 1
let g:cscope_auto_update = 0

"=========== NERD COMMENTER ============
let g:NERDCompactSexyComs = 1

"=============== CTRL-P ================
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_by_filename = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
if executable('fd')
    " Use fd for ctrlp.
    "let g:ctrlp_user_command = 'fd -c never "" "%s"'
    let g:ctrlp_user_command = 'fd -c never --no-ignore-vcs -t file -E tools/ "" "%s"'
    let g:ctrlp_use_caching = 1
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(tools)$',
  \ }

"================= ACK =================
" never jump immediately to first Ack result
cnoreabbrev Ack Ack!
if executable('rg')
" use ripgrep for ack
    let g:ackprg = 'rg --vimgrep --no-heading -F -E UTF-8 -t c --no-sort-files -g !"tools/**" -g !"ewp/**" -g !"build/**" -g !"libraries/aws_iot/**" -g !"libraries/mbedtls/**" --type-add "c:*.tbc" --type-add "c:*.tbs"'
endif

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

"============== SYNTASTIC ==============
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_checkers = ["clang_check","clang_tidy","gcc"]

"============ YOUCOMPLETEME ============
"let g:ycm_register_as_syntastic_checker = 1 "default 1
"let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
"let g:ycm_global_ycm_extra_conf = '$USERPROFILE/vimfiles/.ycm_extra_conf.py'
"let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_enable_diagnostic_highlighting = 0
"let g:ycm_always_populate_location_list = 1 "default 0
"let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
"let g:ycm_complete_in_strings = 1 "default 1
"let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
"let g:ycm_path_to_python_interpreter = '' "default ''
"let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
"let g:ycm_server_log_level = 'info' "default info
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
"let g:ycm_filetype_whitelist = { '*': 1 }
"let g:ycm_key_invoke_completion = '<C-Space>'

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
    let cmd = substitute(cmd, '!', '\!', 'g')
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    if exists('l:shxq_sav')
      let &shellxquote=l:shxq_sav
  endif
endfunction

" After everything else, allow users to override any of this with their own
" specific settings
if filereadable(expand("~/_user.vim"))
  source ~/_user.vim
endif

