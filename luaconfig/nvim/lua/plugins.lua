return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'folke/tokyonight.nvim'

    -- lualine
    use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- bufferline
    use { 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

    -- telescope
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- nerdtree
    use { 'preservim/nerdtree', requires = { 'ryanoasis/vim-devicons', 'tiagofumo/vim-nerdtree-syntax-highlight' } }

    -- toggleterm
    use 'akinsho/nvim-toggleterm.lua'

    -- ack
    use 'mileszs/ack.vim'

    -- blamer
    use 'APZelos/blamer.nvim'

end)
    -- apperative plugins
    -- use 'hrsh7th/vim-vsnip'
    -- use 'glepnir/dashboard-nvim'
    -- use 'marko-cerovac/material.nvim'
    -- use 'andweeb/presence.nvim'
  
    -- functional plugins
    -- use 'neovim/nvim-lspconfig'
    -- use 'hrsh7th/nvim-compe'
    -- use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'williamboman/nvim-lsp-installer'
    -- use 'onsails/lspkind-nvim'
    -- use 'nvim-treesitter/nvim-treesitter'
    -- use 'windwp/nvim-ts-autotag'
    -- use 'norcalli/nvim-colorizer.lua'
    -- use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
    -- use "rafamadriz/friendly-snippets"
