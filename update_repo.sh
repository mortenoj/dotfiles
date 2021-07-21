#!/usr/bin/env bash

rm -rf zsh/*
cp -r ~/.dotfiles zsh/dotfiles
cp ~/.zshrc zsh/.zshrc


# Update vim
declare -a configs=(
    "init.vim"
    "ftplugin"
    "plugin"
    "coc-settings.json"
)

for file in "${configs[@]}"; do
    rm -rf "vim/$file"
    cp -r ~/.config/nvim/$file vim/$file
done
