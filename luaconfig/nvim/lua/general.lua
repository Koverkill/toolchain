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
vim.opt['clipboard'] = 'unnamedplus'
vim.opt['swapfile'] = false
vim.opt['colorcolumn'] = '80'
vim.opt['scrolloff'] = 8
vim.opt['ignorecase'] = true
vim.opt['list'] = true
vim.opt['listchars'] = 'trail:*'

-- Stop comments on newline
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]])
-- tags trickery
vim.cmd([[set tags=./tags,tags;$HOME]])

-- Disable lualine on Nvim-tree
-- vim.cmd ([[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif]])

-- vim.cmd("command CDD cd %:p:h")
