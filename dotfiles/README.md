# Dotfiles
## Overview
```
├── .config                         (Mirrors ~/.config)
│   ├── glow                        (markdown viewer)
│   │   ├── glow.yml                (glow config)
│   │   └── tokyonight.json         (glow colorscheme)
│   ├── lazygit                     (terminal git utility)
│   │   └── config.yml              (lazygit config)
│   ├── nvim                        (My editor)
│   │   ├──plugin                   (Automatically generated via nvim plugin manger)
│   │   │  └── packer_compiled.lua  (Automatically generated via nvim plugin manger)
│   │   └─ init.lua                 (All in one nvim config)
│   └── spotify-tui                 (Terminal Spotify)
│       └── clent-yml               (When you generate your spt key it goes here)
├── oh-my-posh                      (Shell prompt)
│   └── my-microverse.omp.json      (Shell prompt colorscheme)
├── windows-terminal                (Terminal application)
│   ├── fonts                       (Terminal, shell, and editor font)
│   └── settings.json               (Terminal config)
├── .zshrc                          (Shell config)
└── README.md                       (You're looking at it boss)
```
## Version control your ~/.config directory
1. Delete your ~/.config/ directory if it exists.
``` Shell
rm -rf ~/.config
```
2. Create a soft symbolic link to your <version_controlled>/.config/ directory.
``` Shell
ln -s ~/Projects/toolchain/dotfiles/.config ~/.config
```
Remember to provide the **full** path to the source folder/file, not just the relative one.
