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