#/bin/bash

# Path to your oh-my-zsh installation.
export ZSH="/Users/morten/.oh-my-zsh"

plugins=(z zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

ZSH_THEME=""

# Source dotfiles
for dotfile in $(find ~/.dotfiles -name ".*"); do
    [ -f "$dotfile" ] && source "$dotfile"
done
