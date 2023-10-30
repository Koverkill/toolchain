# Toolchain Overview
*"I believe in gradual experimentation with running shoes."* -- Bill Rodgers

This is the WiP of my tools and configurations for my Shell, Prompt, and Editor. I'm also making an effort to include
other tools I find helpful in my development workflow. As a note: I think that there is a spectrum of joy related to
tweaking a config file that I score relatively highly on. I hope that some of this is useful or interesting to the
Reader. but this is certainly not a claim to the best config of all time. Parts of this work really well for me. Parts
of this are artifacts of an earlier understanding. As long as a tool is easy to adjust, improvements can be expected.

Tools in the Toolchain
- WSL
- Windows Terminal
- NeoVim 
- lazygit
- wsl-vscode

# [WSL](https://docs.microsoft.com/en-us/windows/wsl/)
*Windows Subsystem for Linux (WSL) lets developers run a GNU/Linux environment directly on Windows.*

## Installation
https://learn.microsoft.com/en-us/windows/wsl/install

Open PowerShell or Windows Command Prompt in administrator mode by right-clicking and selecting "Run as administrator". To install the default linux distribution (Ubuntu) enter:
``` PowerShell
wsl --install
```
If you want to install an alternative distribution, you can check the available distributions by running:
``` PowerShell
wsl --list --online
```
and install your desired distribution by running:
``` PowerShell
wsl --install -d <DistroName>
```
After you set your username and password for your distribution, run:
``` Bash
sudo apt update && sudo apt upgrade -y
```
## Notes
You can see details about the version of WSL and Distribution that you are using with:
``` PowerShell
wsl -l -v
```
You can switch the version of WSL you are running by using:
``` PowerShell
wsl --set-default-version <Distro> <1|2>
```
You can see the wsl partition within windows file explorer by using ```'\\wsl$'``` or convert a windows to linux file path using the ```'wslpath'``` command.
## Links
- [Should I use WSL1 or WSL2?](https://learn.microsoft.com/en-us/windows/wsl/compare-versions)
- [More info on setup.](https://learn.microsoft.com/en-us/windows/wsl/setup/environment)

# [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/)
*Windows Terminal is a modern terminal application for users of command-line tools and shells.*

## Installation
https://learn.microsoft.com/en-us/windows/terminal/install

## Customization
You can open the Windows Terminal settings with ```(Ctrl + ,)```. You can either modify your settings via the GUI or you can open the ```settings.json``` file. I'd recommend modifying 'Defaults' > 'Appearances' to set your default profile's color scheme and Font face to start.

*note: You may need to remove a conflicting 'Action' if it interferes with other shortcuts you use while editing. For example, I needed to remove the ```'Paste': 'Ctrl + v'``` action as it conflicted with entering visual block mode in vim.*

### Install a Nerd Font
To make your fonts look nice in your terminal you'll need a [Nerd Font](https://www.nerdfonts.com/font-downloads).
1. Download desired font, I have used: *FantasqueSansM*, *Iosevka*, and *VictorMono* Nerd Fonts at various times.
2. Navigate to Downloads, Right click -> Extract All...
3. Open font directory, select all font files except 'LICENSE.md' and 'readme.md', right click > Install.

You can confirm your font is installed by: ```WinKey + 'Font Settings'``` and typing in your font into the ```Available fonts``` field. You will see 3 variants of the installed fonts:
1. Nerd Font
2. Nerd Font Mono
3. Nerd Font Propo

Depending on where you are using this font, you may want to use different variants. The Mono spaced font should work with almost everything, the bigger icon non-Mono variant will work with most terminals, and the proportional (Propo) variant might be useful for a GUI element or presentation.

## Build my prompt for WSL
### [Zsh and Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
*Z shell is an extended version of bash with support for plugins and themes. Oh-My-Zsh is a plugin framework for ZSH.*
``` Bash
sudo apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
You may be prompted to install a custom config at ```~/.zshrc```, since we will be replacing it with ours later on, you
can skip entirely or take a look if your curious.
### [ohmyposh (linux)](https://ohmyposh.dev/docs/installation/linux)
``` Bash
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
sudo apt install unzip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
```
Add these relevant lines to your ```~/.zshrc``` unless you plan to copy the whole config later. Replace ```<your-chosen-theme>``` with one you like from the gallery.
``` Bash
# ZSH plugins
plugins=(git zsh-autosuggestions web-search zsh-syntax-highlighting)

# Remove Underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

# Prompt: oh-my-posh
eval "$(oh-my-posh --init --shell zsh --config '~/.poshthemes/<your-chosen-theme>.omp.json')"
```

## Build my prompt for PowerShell
### [ohmyposh (windows)](https://ohmyposh.dev/docs/installation/windows)
``` PowerShell
winget install JanDeDobbeleer.OhMyPosh -s winget
winget upgrade JanDeDobbeleer.OhMyPosh -s winget
New-Item -Path $PROFILE -Type File -Force
notepad $PROFILE
```
Add the following to your profile:
``` text
oh-my-posh init pwsh --config C:\<windows>\<path_to>\<your-chosen-theme>.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons
```
If you run into:
```
winget : The term 'winget' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
```
I was able to troubleshoot following [this](https://learn.microsoft.com/en-us/windows/iot/iot-enterprise/deployment/install-winget-windows-iot) link.

# NeoVIM
## Installation
``` Bash
wget https://github.com/neovim/neovim/releases/tag/v0.9.4/nvim-linux64.tar.gz -O ~/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
rm -rf nvim-linux64.tar.gz
```

(https://nvchad.com/docs/quickstart/install)
## Config dependencies (based off of NvChad)
- ripgrep
- gcc
- npm
    - prettier
    - clang-format
- win32yank (clipboard utility)

``` Bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb && sudo dpkg -i ripgrep_13.0.0_amd64.deb
rm -rf ripgrep_13.0.0_amd64.deb
sudo apt install gcc -y
sudo apt install make
sudo apt install npm -y
sudo npm install -g prettier
sudo npm install -g clang-format
wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip -O ~/win32yank-x64.zip
unzip win32yank-x64.zip
rm -rf win32yank-x64.zip
chmod +x win32yank.exe
```

## NvChad (if you don't want to use custom config)
``` Bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
I use these aliases in my ```~/.zshrc```:
``` Bash
alias vim="nvim"
alias :q="exit"
```

# [lazygit](https://github.com/jesseduffield/lazygit)
``` Bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```
I use this alias in my ```~/.zshrc```: ``` alias lg="lazygit"```

# [wsl-vscode](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-vscode)
1. Install vscode, ensure to check the 'Add to Path option'.
2. Install Remote Development extension pack.
3. Install dependencies:
``` Bash
sudo apt-get update
sudo apt upgrade
sudo apt-get install wget ca-certificates
sudo apt-get install build-essential gdb
sudo apt install clang
```
Then open a wsl project, run:
``` Bash
code .
```
check 'Do not show again for WSL 2 version prompt'.

## Notes
- I couldn't get gdb debugging to work in wsl-vscode while using WSL1. I changed the version back and then I could run with an unaccounted for debug print in the terminal. I was able to debug my projects with the VSCode UI though despite the ugly print.
- For C/C++ development, I followed [this](https://code.visualstudio.com/docs/cpp/config-wsl) link.
- For Windows C/C++ development (or if you need to use windows only utilitys like windows.h), I followed [this](https://code.visualstudio.com/docs/languages/cpp) link.