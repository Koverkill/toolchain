# Kellen Overvig (koverkill)
# github.com/Koverkill
# My ZSH config

# Exports
export ZSH="$HOME/.oh-my-zsh"
export PATH="/home/overvk2/nvim-linux64/bin/:$PATH"

# Aliases
alias lg="lazygit"
alias vim="nvim"
alias :q="exit"

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

# Prompt: oh-my-posh
eval "$(oh-my-posh --init --shell zsh --config '~/.poshthemes/space.omp.json')"