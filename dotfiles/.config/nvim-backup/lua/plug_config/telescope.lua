-- Telescope
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
            "libraries/newlib-cygwin",
            "%.o",
            "%.lst",
            "%.i",
            "%.s",
            "%.xcl",
            "ewp/",
            ".artifacts/",
            ".vscode/",
            "build/",
            "tags",
        },
    }
}
