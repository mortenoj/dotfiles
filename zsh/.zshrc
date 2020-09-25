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
