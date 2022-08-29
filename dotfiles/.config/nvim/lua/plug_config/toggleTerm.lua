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
    direction = 'tab',
    close_on_exit = true,
    shell = vim.o.shell, -- change the default shell
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction='float', hidden = true })
local spotify = Terminal:new({ cmd = "spt", direction='float', hidden = true })
local glow    = Terminal:new({ cmd = "glow", direction='float', hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

function _spotify_toggle()
    spotify:toggle()
end

function _glow_toggle()
    glow:toggle()
end

vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F3>", "<cmd>lua _spotify_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>lua _glow_toggle()<CR>", {noremap = true, silent = true})
--vim.api.nvim_set_keymap("n", "<F4>", ":ToggleTerm size=120 direction=vertical<CR>", {noremap = true, silent = true})
