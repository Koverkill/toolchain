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

# Install FantastequeSansMono
1. https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono#installation
2. Extract the zip > navigate to the True Type Font > Right Click Install
3. This should resolve issues with your font in windows terminal settings double check your fontface exists in your profile. 
4. If you need a Nerd Font for your fancy prompt you'll need the complete font. (included in the fonts/dir)

# Setting up Prompt with Oh-My-Posh
Assumes you are trying to do this after your profiles are all set-up in windows terminal and you have a Nerd Font and you are
setting it up from Ubuntu.
``` 
1. sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
2. sudo chmod +x /usr/local/bin/oh-my-posh
3. mkdir ~/.poshthemes
4. wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
5. if you don't have unzip, sudo apt-install unzip
6. unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
7. chmod u+rw ~/.poshthemes/*.json
8. rm ~/.poshthemes/themes.zip
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
``` Ubuntu
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
