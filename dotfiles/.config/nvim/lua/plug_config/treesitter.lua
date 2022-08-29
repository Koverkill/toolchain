-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "c", "json", "lua", "python", "vim" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
