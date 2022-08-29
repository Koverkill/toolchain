-- General config
vim.opt['number'] = true
vim.opt['ruler'] = true
vim.opt['splitright'] = true
vim.opt['splitbelow'] = true
vim.opt['smarttab'] = true
vim.opt['expandtab'] = true
vim.opt['smartindent'] = true
vim.opt['autoindent'] = true
vim.opt['tabstop'] = 4
vim.opt['shiftwidth'] = 4
vim.opt['autoread'] = true
vim.opt['title'] = true
vim.opt['termguicolors'] = true
vim.opt['hlsearch'] = true
vim.opt['hidden'] = true
vim.opt['encoding'] = 'utf-8'
vim.opt['fileencoding'] = 'utf-8'
vim.opt['showmode'] = false
vim.opt['swapfile'] = false
vim.opt['colorcolumn'] = '80,120'
vim.opt['scrolloff'] = 8
vim.opt['ignorecase'] = true
vim.opt['list'] = true
vim.opt['listchars'] = 'trail:*'
vim.opt['mouse'] = 'a'

-- Stop comments on newline
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]])
-- tags trickery
vim.cmd([[set tags=./tags,tags;$HOME]])
-- clipboard
vim.cmd([[set clipboard+=unnamedplus]])
vim.cmd([[
let g:clipboard = {
            \   'name': 'win32yank-wsl',
            \   'copy': {
            \      '+': 'win32yank.exe -i --crlf',
            \      '*': 'win32yank.exe -i --crlf',
            \   },
            \   'paste': {
            \      '+': 'win32yank.exe -o --crlf',
            \      '*': 'win32yank.exe -o --crlf',
            \   },
            \   'cache_enabled': 0,
            \}
        ]])

