#!/usr/bin/env bash

rm -rf zsh/*
cp -r ~/.dotfiles zsh/dotfiles
cp ~/.zshrc zsh/.zshrc

cp ~/.tmux.conf ./tmux/
cp ~/.config/alacritty/alacritty.toml ./
cp -r ~/.config/ghostty ./ghostty

cp -r ~/.config/tmuxinator/tmuxinator-configs ./tmuxinator/


# Update vim
declare -a configs=(
    "init.lua"
    "ftplugin"
    "lua"
    "coc-settings.json"
    ".ignore"
)

for file in "${configs[@]}"; do
    rm -rf "vim/$file"
    cp -r ~/.config/nvim/$file vim/$file
done
