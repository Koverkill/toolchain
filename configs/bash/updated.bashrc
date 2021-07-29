# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# lazygit aliases
alias lg='lazygit'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#### End of Default rc
export EDITOR=vim

export KOMODO_DIR="_Git"
export KOMODO_DISK="c"
export KOMODO_BRANCH="_Git/reanimate"

export KOMODO_SOURCE="/mnt/c/_Git/reanimate"
export KOMODO_TOOLCHAIN="/mnt/c/_Git/LLVM/4.0.3/LNX"

KOMODO_DEV_PORT="/dev/ttyS21"

export MKBINS="powershell.exe -Command tools/mkbins.exe"

#### Prompt config ####
#    Gruvbox Color Codes
VIOLET="\[\033[01;38;5;61m\]"
GREEN="\[\033[01;38;5;142m\]"
RED="\[\033[01;38;5;167m\]"
CYAN="\[\033[01;38;5;108m\]"
BASE03="\[\033[38;5;230m\]"

#    Create logical mappings
UserColor=${VIOLET}
PathColor=${GREEN}
GitColor=${RED}
RepoColor=${CYAN}
NormalColor=${BASE03}

function GitBranch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function GitRepo() {
    repo_dir=`git rev-parse --show-toplevel 2> /dev/null`
    if [ -z "${repo_dir}" ]; then
        pwd
    else
        repo_dir=`echo ${repo_dir} | rev | cut -d'/' -f-1 | rev`
        echo "${repo_dir}/"
    fi
}

function GitPath() {
    if [ -z "$(GitRepo)" ]; then
        pwd
    else
        relative_dir=`git rev-parse --show-prefix 2> /dev/null`
        echo "${relative_dir}"
    fi
}

#    Build Prompt
export PS1="${UserColor}\u@work ${PathColor}\$(GitRepo)\$(GitPath)${GitColor}\$(GitBranch)${NormalColor}\n\$ "

function rean() {
    cd /mnt/c/_Git/reanimate
}

function tb() {
    cd /mnt/c/_Git/testboy
}

function tbc() {
    cd /mnt/c/_Git/testboy_cases
}

function bashrc() {
    vim ~/.bashrc
}

function komodo_build_and_send() {
    cd ${KOMODO_BUILD}
    komodo
    mv *.x00 komodo_update.x00
    ota komodo_update.x00 1
}

function komodo_ota() {
    cd ${KOMODO_BUILD}
    mv *.x00 komodo_update.x00
    ota komodo_update.x00 1
}

function vimrc() {
    vim ~/.vimrc
}

function komodo() {
    cd /mnt/c/_Git/reanimate
    rm -rf build/komodo
    make -f ewp/komodo.make -j $1
}

function viola() {
    dir=`pwd`
    cd /mnt/c/_Git/reanimate
    cmd.exe /c "C:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 8.2\\common\\bin\\IarBuild.exe" ewp/viola.ewp -make engineering -parallel 8
    cd /mnt/c/_Git/reanimate/tools/mkbins
    ./mkbins_impossiblewhopper ../../build/viola/engineering/exe/viola 100
    cd $dir
}

function castanet() {
    dir=`pwd`
    cd /mnt/c/_Git/reanimate
    cmd.exe /c "C:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 8.2\\common\\bin\\IarBuild.exe" ewp/castanet.ewp -make engineering -parallel 8
    cd $dir
}

function castanet_boot() {
    dir=`pwd`
    cd /mnt/c/_Git/reanimate
    cmd.exe /c "C:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 8.2\\common\\bin\\IarBuild.exe" ewp/castanet_boot.ewp -make engineering -parallel 8
    cd $dir
}

function harpsichord() {
    dir=`pwd`
    cd /mnt/c/_Git/reanimate
    cmd.exe /c "C:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 8.2\\common\\bin\\IarBuild.exe" ewp/harpsichord.ewp -make engineering -parallel 8
    cd $dir
}

function harpsichord_boot() {
    dir=`pwd`
    cd /mnt/c/_Git/reanimate
    cmd.exe /c "C:\\Program Files (x86)\\IAR Systems\\Embedded Workbench 8.2\\common\\bin\\IarBuild.exe" ewp/harpsichord_boot.ewp -make engineering -parallel 8
    cd $dir
}

function komodo_server() {
    dir=`pwd`
    cd /mnt/c/_Git/utils/Zubie/Py3
    python3 Py3_MQTT_Client.py -f kellen_py3config.txt -d debug
    cd $dir
}

function castanet_server() {
    dir=`pwd`
    cd /mnt/c/_Git/utils/Zubie/Py3
    python3 Py3_MQTT_Client.py -f kellen_py3config_castanet.txt -d debug
    cd $dir
}

function harpsichord_server() {
    dir=`pwd`
    cd /mnt/c/_Git/utils/Zubie/Py3
    python3 Py3_MQTT_Client.py -f kellen_py3config_harpsichord.txt -d debug
    cd $dir
}

function castanet_vince() {
    dir=`pwd`
    cd /mnt/c/_Git/utils/Zubie/Py3
    python3 Py3_MQTT_Client.py -f vince_py3config.txt -d debug
    cd $dir
}

function komodo_upload() {
    dir=`pwd`
    cd /mnt/c/_Git/scripts
    ./komodo_upload.sh ${KOMODO_DEV_PORT}
    cd $dir
}

function komodo_tio() {
    tio ${KOMODO_DEV_PORT} 
}

function yourway() {
    dir=$(pwd)
    cd /mnt/c/_Git/reanimate/build/tools/
    mv whopper whopper.exe
    cd /mnt/c/_Git/reanimate/tools/
    bash yourway.sh ${1} ${2} ${3}
    cd /mnt/c/_Git/reanimate/build/tools/
    mv whopper.exe whopper
    cd ${dir}
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --glob "!.git/*"'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export LD_LIBRARY_PATH="/usr/local/lib"

# AWS stuff
source ~/.bash_aws

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/mnt/c/_Git/ccls/Release/
export PATH=$PATH:/mnt/c/win32yank-x64/
cd /mnt/c/_Git