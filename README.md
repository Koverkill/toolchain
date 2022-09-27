# Toolchain Overview
*"I believe in gradual experimentation with running shoes."* -- Bill Rodgers

This is the WiP of my tools and configurations for my Shell, Prompt, and Editor. I'm also making an effort to include
other tools I find helpful in my development workflow. As a note: I think that there is a spectrum of joy related to
tweaking a config file that I score relatively highly on. I hope that some of this is useful or interesting to the
Reader. but this is certainly not a claim to the best config of all time. Parts of this work really well for me. Parts
of this are artifacts of an earlier understanding. As long as a tool is easy to adjust, improvements can be expected.

# Tools in the Toolchain
## [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/)
*Windows Terminal is a modern terminal application for users of command-line tools and shells.*

Choosing what terminal you use influences aesthetics of other tools in your chain. Experimenting with terminals before
investing time in customizing an editor is worthwhile to find limitations in this layer of your setup. I find the tab,
pane, and visual customization of Windows Terminal to work well for me. My settings.json file found in:
'dotfiles/windows-terminal' includes the colorscheme I use across my terminal and editor. Included in the:
'dotfiles/windows-terminal/fonts' is the NerdFont that I use across my terminal and editor.

## [Zsh and Oh-My-Zsh](https://ohmyz.sh/)
*Z shell is an extended version of bash with support for plugins and themes. Oh-My-Zsh is a plugin framework for ZSH.*

I originally was using Oh-My-Posh to create a nice looking prompt for my terminal. I swapped to ZSH mostly for the
desire to have auto suggestions. While I believe ZSH supports its own syntax for scripting, I pretty much only write
scripts with the conventional Bash syntax. I've heard good things about [fish](https://fishshell.com/) and
[starship](https://starship.rs/) if you are interested in other options.

## [WSL](https://docs.microsoft.com/en-us/windows/wsl/)
*Windows Subsystem for Linux (WSL) lets developers run a GNU/Linux environment directly on Windows.*

I initially was using WSL as a requirement in our build process for a Linux only utility. While that is no longer a
need, the workflow in WSL land was nice enough to stay. A couple of things I'll point out:
- If you can, clone repos within the WSL file system ex: '~/Projects'. It's faster and cooler.
- You can access your Linux files in the windows file explorer using '\\wsl$' in the file explorer.
The ability to export your linux distro to be used in WSL allows you to move much of your workflow with relative ease.

## [Ubuntu-18.04](https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab)
*Ubuntu is a complete Linux operating system, freely available with both community and professional support.*

While I am far from a Linux distro expert, Ubuntu-18.04 has worked well for me. I have tried Ubuntu-20.04 but the
current limitations of serial devices was too much of an obstacle for my work flow, I wouldn't be surprised if I try a
new distro and like it more.

## [Microsoft PowerToys](https://docs.microsoft.com/en-us/windows/powertoys/)
*Microsoft PowerToys is a set of utilities for users to tune their Windows experience.*

I find this useful primarily for 'FancyZones' and for 'Keyboard Manager'. With pre-defined zones you can easily snap
windows to these zones (useful for big monitors). Keyboard Manager is my new solution for re-mapping keys and
includes the nice ability to map keys -> chords and vice versa. I recommend turning off 'Enable Find My Mouse' in
'Mouse Utilities'.

## [NeoVIM](https://github.com/neovim/neovim/releases)
*Hyperextensible Vim-based text editor.*

My NeoVIM config is probably the file I tweak most. The current iteration can be found at: 'dotfiles/nvim/'. While there
have been many iterations, the current one is a single file (init.lua) which was intentional, but against the precedent
of a sourcing order and ftplugin directories you may see in other dotfile repos. My justification is I wanted it to be
as easy as possible to tweak when I find behaviors I want to change as well as easy to share with people unfamiliar with
the config file structure. I tried to strike the balance of notes to compactness with the goal of readability.

The following are executables I have wrapped into this config which I will mention here for ease of reference.

### [lazygit](https://github.com/jesseduffield/lazygit)
*Simple terminal UI for git commands.*

### [spotify-tui](https://github.com/Rigellute/spotify-tui)
*A Spotify client for the terminal.*

### [Win32yank](https://github.com/equalsraf/win32yank)
*clipboard tool for windows allows copy and pasting from yanked registers in nvim.*
