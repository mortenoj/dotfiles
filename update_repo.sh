#!/usr/bin/env bash

rm -rf zsh/*
cp -r ~/.dotfiles zsh/dotfiles
cp ~/.zshrc zsh/.zshrc


# Update vim
rm -rf vim/init.vim vim/configs
cp -r ~/.config/nvim/init.vim ~/.config/nvim/configs vim/
