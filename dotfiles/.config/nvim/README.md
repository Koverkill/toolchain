# My neovim config in lua (always a WIP)
This is my neovim config post conversion to lua. There are still some artifacts of vimscript from my old config and some
general clutter from not being clear on how the lua config works.

## Screenshots/videos
@todo

## Requirements
- NVIM > v0.7.0

## My Current Architecture (Gross)
```
├── README.md               (You're looking at it boss)
├── init.lua                (Starting point)
├── plugin
│   └── packer_compiled.lua (Automatically generated packer .nvim plugin loader code)
└── lua
    ├── plugins.lua         (required plugins)
    ├── plug_config         (plugin specific config files)
    │   └── plugin.lua      (plugin specific config files)
    ├── bindings.lua        (non-plugin specific keybindings?)
    ├── general.lua         (general nvim things)
    └── xirgo.lua           (work specific settings)
```

## Improved Architecture [CNULL] (https://github.com/creativenull/nvim-config)
```
├── init.lua               (Starting point)
├── after
│   └── ftplugin           (Plugins to be loaded on the 'FileType' event)
└── lua
    └── cnull
        ├── core           (Initial setup and utilities called from here)
        ├── lsp            (Everything LSP related, setup for the built-in LSP)
        ├── plugins        (Plugins organized by features instead of plugin names)
        └── user           (My custom user configuration independent of plugins)
```

## Features
@todo
## Feature Wishlist
1. LSP support for C, Python, Bash, Go, Markdown
2. Autocompletion
3. git history by commit of a file (for reanimate work)
4. Nice Markdown Preview (Glow)
5. vim-surround
6. snippets
## Behavior Change Wishlist
1. Better buffer open/close behavior
2. :Ack! weirdness
3. rg for non reanimate directories i.e. this error message 
(|| No files were searched, which means ripgrep probably applied a filter you didn't expect. Try running again with --debug.)