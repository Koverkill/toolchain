require("toggleterm").setup{
    size = 18,
    open_mapping = '<F1>',
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 3,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    --direction = 'float',
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell, -- change the default shell
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction='float', hidden = true })
local spotify = Terminal:new({ cmd = "spt", direction='float', hidden = true })
local glow    = Terminal:new({ cmd = "glow", direction='float', hidden = true })
local vscode  = Terminal:new({direction='horizontal', hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

function _spotify_toggle()
    spotify:toggle()
end

function _glow_toggle()
    glow:toggle()
end

function _vscode_toggle()
    vscode:toggle()
end

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua _spotify_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua _glow_toggle()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<F4>", ":ToggleTerm size=120 direction=vertical<CR>"o {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<Leader>t", ":ToggleTerm size=10 direction=horizontal<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>t", "<cmd>lua _vscode_toggle()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("t", "<Leader>t", ":ToggleTermToggle<CR>", {noremap = true, silent = true})
