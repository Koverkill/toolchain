# Kellen Overvig (koverkill)
# https://github.com/Koverkill
# My ZSH config

# Exports
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export ZSH="$HOME/.oh-my-zsh"

# Aliases

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
# tools
alias lg="lazygit"
alias vim="nvim"
alias xsdk="python3 -m xsdk"

export PATH="/bin:/usr/bin:/usr/local/bin:/home/kovervig/local/bin:/home/kovervig/scripts/:/usr/local/go/bin:/home/kovervig/glow/:/home/kovervig/nvim-linux64/bin/:$PATH"

export PATH="$HOME/tools/llvm-project/build/bin:$HOME/clangd/clangd/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/tools/llvm-project/build/lib:$LD_LIBRARY_PATH"

# ZSH
plugins=(git zsh-autosuggestions web-search)
# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh
# oh-my-zsh
eval "$(oh-my-posh --init --shell zsh --config '~/.poshthemes/microverse-power.omp.json')"
