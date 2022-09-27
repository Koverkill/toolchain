-- init.lua (requires NVIM v0.7)
-- Kellen Overvig
-- github.com/Koverkill

--------------------------------------------------------------------------------
-- Overview --------------------------------------------------------------------
--------------------------------------------------------------------------------
-- 1. Plugin Manager and Installation
-- 2. General Settings
-- 3. Functions and Autocommands
-- 4. Plugin Settings
-- 5. Keymaps

--------------------------------------------------------------------------------
-- 1. Plugin Managemer and Installation ----------------------------------------
--------------------------------------------------------------------------------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Plugin Manager --
    use 'wbthomason/packer.nvim'
    -- Color Theme --
    use 'folke/tokyonight.nvim'
    -- Status Line --
    use 'hoob3rt/lualine.nvim'
    -- Buffer Line --
    use 'akinsho/bufferline.nvim'
    -- Language Parsing and Highlighting --
    use 'nvim-treesitter/nvim-treesitter'
    -- Fuzzy Finder --
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- Terminal Wrapper --
    use 'akinsho/nvim-toggleterm.lua'
    -- Autopairs --
    use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end }

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

--------------------------------------------------------------------------------
-- 2. General Settings ---------------------------------------------------------
--------------------------------------------------------------------------------
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
vim.o.colorcolumn = '80'
vim.o.scrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.listchars = 'trail:*'
vim.o.mouse = 'a'

    -- Colorscheme --
require('tokyonight').setup({
    style = 'storm',
    styles = {
        comments = 'NONE',
        keywords = 'NONE',
    },
})

vim.cmd[[colorscheme tokyonight]]

    -- Copy/Paste with win32yank, a wsl clipboard util --
if vim.fn.executable('win32yank.exe') == 1 then
    vim.cmd([[set clipboard+=unnamedplus]])
    vim.g.clipboard = {
        name = 'win32yank-wsl',
        copy = {
            ['+'] = 'win32yank.exe -i --crlf',
            ['*'] = 'win32yank.exe -i --crlf'
        },
        paste = {
            ['+'] = 'win32yank.exe -o --crlf',
            ['*'] = 'win32yank.exe -o --crlf'
        },
        cache_enable = 0,
    }
end

    -- Space is King! --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--------------------------------------------------------------------------------
-- 3. Functions and Autocommands -----------------------------------------------
--------------------------------------------------------------------------------
    -- keymap helper --
function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

    -- Use ctrl+vim movements in Terminal mode --
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    map('t', '<esc>', [[<Cmd>close<CR>]], opts)
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

    -- Change editor behavior for text files --
function _G.text_edit_mode()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 120
    vim.opt_local.colorcolumn = '120'
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    -- Accept 1st spelling suggestion with <Leader>z --
    map('n', '<Leader>z', '1z=')
end

    -- Using vim script for augroups for now --
vim.cmd[[
augroup files
    "" Don't add comment on newline
    "" Always open :help in new Vertical window
    "" Tweak filetype recognition
    autocmd!
    autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufEnter * if &ft ==# 'help' | wincmd L | endif
    autocmd TermOpen term://* lua set_terminal_keymaps()
    autocmd BufRead,BufNewFile *.md,*.txt lua text_edit_mode()
    autocmd BufRead,BufNewFile *.h set filetype=c
    autocmd BufRead,BufNewFile *.*py set filetype=python
augroup END
]]

--------------------------------------------------------------------------------
-- 4. Plugin Settings ----------------------------------------------------------
--------------------------------------------------------------------------------
    -- Plugin Settings: Lualine --
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

    -- Plugin Settings: Bufferline --
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
        sort_by = 'id',
        color_icons = true,
        show_buffer_default_icon = true,
    },
}

    -- Plugin Settings: Treesitter --
require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'bash', 'c', 'go', 'json', 'lua', 'python', 'vim' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

    -- Plugin Settings: Telescope --
require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
            height = 0.95,
            width = 0.95,
        },
        disable_coordinates = true,
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
            '.git/',
            '.gitmodules',
            '.gitignore',
            '.fdignore',
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    }
}

    -- Plugin Settings: Toggleterm --
require('toggleterm').setup{
    size = 18,
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

local Terminal  = require('toggleterm.terminal').Terminal

    -- lazygit: git tui --
    local lazygit = Terminal:new({ cmd = 'lazygit', direction='float', hidden = true })
    function _lazygit_toggle()
        if vim.fn.executable('lazygit') == 1 then
            lazygit:toggle()
        end
    end

    -- spt: spotify tui --
    local spotify = Terminal:new({ cmd = 'spt', direction='float', hidden = true })
    function _spotify_toggle()
        if vim.fn.executable('spt') == 1 then
            spotify:toggle()
        end
    end

--------------------------------------------------------------------------------
-- 5. Keymaps ------------------------------------------------------------------
--------------------------------------------------------------------------------
    -- Window movement/moving --
map('n', '<Leader>k', ':wincmd k<CR>')
map('n', '<Leader>j', ':wincmd j<CR>')
map('n', '<Leader>h', ':wincmd h<CR>')
map('n', '<Leader>l', ':wincmd l<CR>')
map('n', '<Leader>v', ':wincmd v<CR>')
map('n', '<Leader>s', ':wincmd s<CR>')
map('n', '<Leader>q', ':wincmd q<CR>')
    -- Shift visual blocks up and down with K/J --
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

    -- Netrw for file exploration --
map('n', '<Leader>e', ':Explore<CR>')

    -- Bufferline --
for i = 1, 9, 1 do
    map('n', string.format('<Leader>%d', i),
    string.format('<Cmd>BufferLineGoToBuffer %d<CR>', i))
end
map('n', '<Leader>]', '<Cmd>BufferLineCycleNext<CR>')
map('n', '<Leader>[', '<Cmd>BufferLineCyclePrev<CR>')
map('n', '<Leader>bc', ':BufferLinePickClose<CR>')
map('n', '<Leader>bc]', '<Cmd>BufferLineCloseRight<CR>')
map('n', '<Leader>bc[', '<Cmd>BufferLineCloseLeft<CR>')

    -- Telescope --
map('n', '<C-P>', ':Telescope find_files <CR>')
map('n', '<Leader>f', ':Telescope live_grep <CR>')
map('n', '<Leader>a', ':Telescope grep_string <CR>')
map('n', '<Leader>r', ':Telescope resume <CR>')

    -- Toggleterm --
map('n', '<Leader>t', '<Cmd>execute v:count . "ToggleTerm"<CR>')
map('n', '<Leader>g', '<cmd>lua _lazygit_toggle()<CR>')
map('n', '<F3>', '<cmd>lua _spotify_toggle()<CR>')
