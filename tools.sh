#!/usr/bin/env bash

# Install homebrew, if not installed
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Updating brew
brew update
brew doctor

# -------------------------------
# -------- Applications ---------
# -------------------------------
brew install --cask slack
brew install --cask spotify
brew install --cask alfred
brew install --cask amethyst # window manager

# Browsers
brew install --cask brave-browser
brew install --cask google-chrome
brew install --cask firefox

# Terminal
brew install --cask alacritty

# Development
brew install --cask tableplus
brew install --cask altair-graphql-client
brew install --cask visual-studio-code

# -------------------------------
# --------- Dev tools ----------
# -------------------------------
brew install neovim
brew install kubectl
brew install kubectx
brew install jq
brew install cmake
brew install gpg2
brew install gnupg
brew install gnu-sed
brew install pinentry-mac       
brew install scrcpy
brew install md5sha1sum

# Golang
brew install go
brew install golangci-lint

# Node
brew install node
npm install -g n  # interactive node version manager

# npm install -g react-native-cli
# npm install -g expo-cli

# Postgres
brew install postgres@14
createdb $USER
brew install postgis

# idb
brew tap facebook/fb
brew install idb-companion
pip3 install fb-idb

brew install ios-deploy

brew install luarocks
brew install stylua
brew install prettierd


# -------------------------------
# ------- Terminal tools --------
# -------------------------------

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install --all

brew install tmux
brew install tmuxinator

brew install ripgrep
brew install ack
brew install reattach-to-user-namespace
brew install watch
brew install az

brew install vifm
brew install pure
brew install ag
brew install datawire/blackbird/telepresence-arm64 # only for Apple silicon macs
brew install exa # replacement for ls
brew install bat # replacement for cat
brew install git-delta # better `less`

brew install gh
gh alias set co --shell 'id="$(gh pr list -L100 | fzf | cut -f1)"; [ -n "$id" ] && gh pr checkout "$id"'

# Install, and setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


gh alias set co --shell 'id="$(gh pr list -L100 | fzf | cut -f1)"; [ -n "$id" ] && gh pr checkout "$id"'

# install rust + cargo (used for some vim plugins)
# listed last because install script is interactive
curl https://sh.rustup.rs -sSf | sh


echo "Manual steps:"
echo " - Setup git config for delta: https://github.com/dandavison/delta"
echo " - Activate zsh auto completions: add 'zsh-autosuggestions' to the plugins array in .zshrc"
