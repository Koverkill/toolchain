-- File Overview
-- Plugin Manager - Packer Installation
-- Plugin Installation
-- General Settings
-- Colorscheme Settings
-- General Keymaps
-- Autocommands
-- Plugin Settings

-- Plugin Manager - Packer Installation ----------------------------------------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- Plugin Installation ---------------------------------------------------------
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Plugin Manager
    use 'folke/tokyonight.nvim' -- Color Theme
    use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- Status Line
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'} -- Buffer Line
    use 'nvim-treesitter/nvim-treesitter' -- Language Parsing and Highlighting
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder
    use 'akinsho/nvim-toggleterm.lua'

    if is_bootstrap then
        require('packer').sync()
    end
end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})

-- General Settings ------------------------------------------------------------
vim.o.updatetime = 250
vim.o.number = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoread = true
vim.o.title = true
vim.o.termguicolors = true
vim.o.hlsearch = true
vim.o.hidden = true
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.showmode = false
vim.o.swapfile = false
vim.o.colorcolumn = '80,120'
vim.o.scrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.listchars = 'trail:*'
vim.o.mouse = 'a'

-- Colorscheme Settings --------------------------------------------------------
require("tokyonight").setup({
    style = "storm",
    styles = {
        comments = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
    },
})

vim.cmd[[colorscheme tokyonight]]

-- General Keymaps -------------------------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- wsl-clipboard
vim.cmd([[set clipboard+=unnamedplus]])
vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
        ["+"] = "win32yank.exe -o --crlf",
        ["*"] = "win32yank.exe -o --crlf"
    },
    cache_enable = 0,
}

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('n', '<Leader>e', ":Explore<CR>")

-- Autocommands ----------------------------------------------------------------
-- create a group to avoid reloading autocommands each time you source init.lua
-- @todo there must be a cleaner way
local markdown_group = vim.api.nvim_create_augroup('Markdown', { clear = true})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.md" },
    command = "setlocal spell | map('<buffer>', '<Leader>z', '1z=')", -- buffer remap for correcting spelling
    group = markdown_group,
})

local c_group = vim.api.nvim_create_augroup('C', { clear = true})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.h" },
    command = "setfiletype=c",
    group = c_group,
})

local tbpy_group = vim.api.nvim_create_augroup('tbpy', { clear = true})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.tbpy" },
    command = "setfiletype=python",
    group = tbpy_group,
})

-- Plugin Settings: Lualine ----------------------------------------------------
-- See ':help lualine.txt'
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
    },
    sections = {
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        }
    }
}
-- Plugin Settings: Bufferline -------------------------------------------------
-- See ':help bufferline.txt'
require('bufferline').setup {
    options = {
        numbers = function(opts)
            return string.format('%s.', opts.ordinal)
        end,
        indicator = {
            icon = '▎',
            style = 'icon'
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id",
        color_icons = true,
        show_buffer_default_icon = true,
    },
}

for i = 1, 9, 1 do
    map('n', string.format('<Leader>%d', i),
    string.format('<Cmd>BufferLineGoToBuffer %d<CR>', i))
end
map('n', '<Leader>=', '<Cmd>BufferLineCycleNext<CR>')
map('n', '<Leader>-', '<Cmd>BufferLineCyclePrev<CR>')
map('n', '<Leader>c=', '<Cmd>BufferLineCloseRight<CR>')
map('n', '<Leader>c-', '<Cmd>BufferLineCloseLeft<CR>')
map('n', '<Leader>c', ':BufferLinePickClose<CR>')

-- Plugin Settings: Treesitter -------------------------------------------------
-- See ':help treesitter.txt
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "c", "go", "json", "lua", "python", "vim" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Plugin Settings: Telescope --------------------------------------------------
-- See ':help telescope' and ':help telescope.setup()'
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore',
            '--hidden'
        },
        file_ignore_patterns = {
            ".git/",
            ".gitmodules",
            ".gitignore",
            ".fdignore",
            "libraries/alt1250",
            "libraries/aws_iot",
            "libraries/coap",
            "libraries/jsmn",
            "libraries/json",
            "libraries/libefs",
            "libraries/libvbus",
            "libraries/lr1110",
            "libraries/mbedtls",
            "libraries/miniz",
            "libraries/msgpack",
            "libraries/newlib-cygwin",
            "libraries/qapi",
            "libraries/qtapi",
            "libraries/threadx_api",
            "%.bin",
            "%.x00",
            "%.o",
            "%.lst",
            "%.i",
            "%.s",
            "%.xcl",
            "ewp/",
            ".artifacts/",
            ".vscode/",
            "doxy/",
            "build/",
            "tags",
        },
    }
}
map('n', '<C-P>', ':Telescope find_files hidden=true<CR>')
map('n', '<Leader>q', ':Telescope live_grep disable_coordinates=true<CR>')
map('n', '<Leader>a', ':Telescope grep_string disable_coordinates=true<CR>')

-- Plugin Settings: Toggleterm -------------------------------------------------
-- See 'help toggleterm.txt
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
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
}

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen zsh;#toggleterm* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction='float', hidden = true })
local spotify = Terminal:new({ cmd = "spt", direction='float', hidden = true })

function _lazygit_toggle()
    lazygit:toggle()
end

function _spotify_toggle()
    spotify:toggle()
end

map('n', '<Leader>lg', '<cmd>lua _lazygit_toggle()<CR>')
map('n', '<F3>', '<cmd>lua _spotify_toggle()<CR>')
---- .
