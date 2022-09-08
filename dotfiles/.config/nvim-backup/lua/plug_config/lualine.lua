-- Lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight'
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
