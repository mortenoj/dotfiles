#!/usr/bin/env bash

rm -rf zsh/*
cp -r ~/.dotfiles zsh/dotfiles
cp ~/.zshrc zsh/.zshrc


# Update vim
rm -rf vim/init.vim vim/settings
cp -r ~/.config/nvim/init.vim ~/.config/nvim/settings ~/.config/nvim/ftplugin vim/
