# My neovim config in lua (always a WIP)
This is my neovim config post conversion to lua. There are still some artifacts of vimscript from my old config and some
general clutter from not being clear on how the lua config works.

## Rules
- Behavior Changes should be easy to implement.
- Remove duplicates.

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

## CNULL's Architecture [CNULL] (https://github.com/creativenull/nvim-config)
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

## New Architecture (Nice!)
```
.
├── README.md               # You're looking at it boss
├── after
│   └── ftplugin            # file specific settings
├── init.lua                # main entry point
├── lua
│   ├── config/             # plugin specific configurations and keybinds
│   ├── autocmd.lua         # autocommands - :h autocmd.txt
│   ├── functions.lua       # lua functions to extend functionality
│   ├── mappings.lua        # Vim keymaps definitions -> config/which.lua for more
│   ├── options.lua         # non plugin related (vim) options
│   ├── plugins.lua         # define plugins to be managed via Packer
│   └── user-conf.lua       # parameters to configure some settings
├── plugin                  # packer_compiled
├── snippets                # snippets directory (luasnip style)
└── spell                   # my spell files linked from another repo
```
## Features
@todo
## Feature Wishlist
1. LSP support for C, Python, Bash, Go, Markdown, Lua?
2. Autocompletion
3. git history by commit of a file (for reanimate work)
4. Nice Markdown Preview (Glow)
5. vim-surround
6. snippets
7. spellcheck for comments and markdown/txt files
## File type plugins
```
├── after
│   └── ftplugin      # file specific settings
```
1. Enable spellcheck for md and txt files

## Behavior Change Wishlist
1. Better buffer open/close behavior
2. :Ack! weirdness
3. rg for non reanimate directories i.e. this error message:
(|| No files were searched, which means ripgrep probably applied a filter you didn't expect. Try running again with --debug.)
4. Named ack buffer
5. .h files as c file types rather than cpp
6. reanimate style notes while in the reanimate dir
7. Auto reload on buffer change
8. Start telescope instead of nerdtree
9. Toggle spotify/lg with same button rather than q
10. Smart sentence wrapping, auto formatting for .md files (near end of 120)
11. ^I being inserted with plain text paste
12. Avoid jumping to the wrong cellular library
