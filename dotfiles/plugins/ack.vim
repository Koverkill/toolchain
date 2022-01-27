Plug 'mileszs/ack.vim'

nmap <leader>q :Ack
nnoremap <leader>a :Ack! <cword><cr>
vnoremap <leader>a y:Ack! "<C-r>""<CR>

cnoreabbrev Ack Ack!
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
