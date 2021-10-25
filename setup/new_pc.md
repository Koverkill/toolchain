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
