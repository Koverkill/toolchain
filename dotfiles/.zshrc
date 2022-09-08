# Kellen Overvig (koverkill)
# github.com/Koverkill
# My ZSH config

# Exports
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export ZSH="$HOME/.oh-my-zsh"
export LD_LIBRARY_PATH="$HOME/tools/llvm-project/build/lib:$LD_LIBRARY_PATH"

# Aliases
alias lg="lazygit"
alias vim="nvim"
alias xsdk="python3 -m xsdk"

# Exports
export PATH="/bin:/usr/bin:/usr/local/bin:/home/kovervig/local/bin:/home/kovervig/scripts/:/usr/local/go/bin:/home/kovervig/glow/:/home/kovervig/nvim-linux64/bin/:$HOME/tools/llvm-project/build/bin:$HOME/clangd/clangd/bin:$PATH"

# Source my helper funcs
source <(cat $HOME/scripts/*.sh)

# ZSH plugins
plugins=(git zsh-autosuggestions web-search zsh-syntax-highlighting)

# Remove Underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

# oh-my-zsh
eval "$(oh-my-posh --init --shell zsh --config '~/.poshthemes/microverse-power.omp.json')"
