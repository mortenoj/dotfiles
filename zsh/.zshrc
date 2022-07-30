#/bin/bash

# Path to your oh-my-zsh installation.
export ZSH="/Users/morten/.oh-my-zsh"

plugins=(z)

source $ZSH/oh-my-zsh.sh

ZSH_THEME=""

# Source dotfiles
for dotfile in $(find ~/.dotfiles -name ".*"); do
    [ -f "$dotfile" ] && source "$dotfile"
done

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/morten/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/morten/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/morten/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/morten/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

