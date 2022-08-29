# Managing your dotfiles with symbolic links + Git
First delete your ~/.config/ directory if it exists (@note this assumes you want to version control all your .config).
Then create a symbolic link to your dotfiles/.config/ dir
``` Shell
rm -rf ~/.config
ln -s ~/Projects/toolchain/dotfiles/.config ~/.config
```
Now when you edit your configs, they will be automatically be version controlled.
