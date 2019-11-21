#!/usr/bin/env bash

rm -rf zsh/*
cp -r ~/.dotfiles zsh/dotfiles
cp ~/.zshrc zsh/.zshrc


# Update vim
rm -f vim/init.vim
cp ~/.config/nvim/init.vim vim/init.vim
