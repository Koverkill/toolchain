# Enable WSL for Windows
1. Open Control Panel > Programs > Programs and Features > Turn Windows features on or off 
2. Select 'Windows Subsystem for Linux'
3. Reset your PC

# Install Ubuntu 18.04 LTS
1. Windows Store > Search for 'Ubuntu 18.04 LTS' > Install
2. Windows Key + 'Ubuntu 18.04', after installing you'll be prompted to create a username/password
3. Send command 'uuidgen', save this generated guid for 'Download Windows Terminal' Step 6.

# Set-up drives in WSL
If you run into issues cloning a repo in WSL to one of your drives,
1. run:  'sudo umount /mnt/<drive-letter>
2. then: 'sudo mount -t drvfs E: /mnt/<same-drive-letter> -o metadata

# Download Windows Terminal
1. https://docs.microsoft.com/en-us/windows/terminal/install 
2. Windows Key + 'Terminal'
3. CTRL + , to open settings
4. Click the settings wheel 'Open JSON file' 
5. Copy and Paste settings.json from toolchain/dotfiles directory.
6. Update the default profile gui to the generated guid from 'Install Ubuntu 18.04 LTS' Step 3.

# Re-map CAPSLOCK -> ESC
1. Windows Key + 'Registry Editor'
2. 'Yes' if prompted by Windows.
3. File > Import > Select 'keys' from toolchain/key_remapping
4. Will require a PC restart, may want to enable WSL before doing so.

note: if you have a keyboard with special keys, I used a tool called 'sharpkeys' to edit my key registry.
# Install FantastequeSansMono
1. https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono#installation
2. Extract the zip > navigate to the True Type Font > Right Click Install
3. This should resolve issues with your font in windows terminal settings double check your fontface exists in your profile. 
4. If you need a Nerd Font for your fancy prompt you'll need the complete font. (included in the fonts/dir)

# Setting up Prompt with Oh-My-Posh
Assumes you are trying to do this after your profiles are all set-up in windows terminal and you have a Nerd Font and you are
setting it up from Ubuntu.
``` console
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
sudo apt install unzip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip
```
to preview themes: 
```
for file in ~/.poshthemes/*.omp.json; do echo "$file\n"; oh-my-posh --config $file --shell universal; echo "\n"; done;
```
Then after you've found a theme you like add it to your ~/.bashrc
```
eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/<youretheme>.omp.json)"
```
To get it working for powershell:
From PS:
1. winget install JanDeDobbeleer.OhMyPosh
2. create your powershell profile:
``` console
mkdir /mnt/c/Users/kelle/Documents/PowerShell
touch /mnt/c/Users/kelle/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
```
``` PS
notepad $profile
```
3. Add: oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression
Set-PoshPrompt -Theme jandedobbeleer
4. Save and reload
5. if you run into an error with Set-PoshPrompt: run
```
Update-Module -Name oh-my-posh -Scope CurrentUser
```

# Install LazyGit
https://github.com/jesseduffield/lazygit

# NeoVIM
```console
sudo apt remove neovim -y
```
Now do you can update normally with the commands:
```console
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```
## Get VIM plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

Run :PlugInstall from nvim

# Get clip working in wsl
Download and unzip win32yank-x64
then add it to your path with: 
export PATH=$PATH:/mnt/d/win32yank-x64/
then the added section in your rc should work as expected

# Get bat in wsl ubuntu (for highlighting in FZF)
sudo apt-get install wget
wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd64.deb
sudo dpkg -i bat_0.18.3_amd64.deb

# Get Ack working with silversearcher (code searching tools)
sudo apt-get install silversearcher-ag

# TMUX
sudo apt install tmux

# Zsh and Oh-my-zsh
## Install
sudo apt install zsh
chsh -s $(which zsh)
## Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## Zsh Auto Complete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# pip3 
sudo apt install python3-pip
pip3 install -r requirements.txt

