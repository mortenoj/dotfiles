#!/usr/bin/env bash

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Updating brew
brew update
brew doctor

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# -------------------------------
# -------- Applications ---------
# -------------------------------
# Must have applications
brew cask install slack
brew cask install caprine
brew cask install spotify
brew cask install 1password
brew cask install alfred

# Browsers
brew cask install google-chrome
brew cask install firefox

# Terminal
brew cask install iterm2

# Design tools
brew cask install figma
brew cask install zeplin

# Development
brew cask install docker
brew cask install minikube
brew cask install tableplus
brew install neovim
brew cask install visual-studio-code
brew cask install java


# -------------------------------
# --------- Dev tools ----------
# -------------------------------
brew install kubectl
brew install kubectx
brew install jq
brew install vault
brew install consul
brew install cmake
brew install hub

# Python
brew install python3

# databases
brew install postgres
createdb $USER
brew install postgis
brew install mongodb
brew install redis

# RVM
brew install gnupg
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# Golang
brew install go
brew install dep

# Node
brew install node
npm install -g react-native-cli
npm install -g nodemon
npm install -g n
npm install -g pure-prompt
npm install -g expo-cli

# -------------------------------
# ------- Terminal tools --------
# -------------------------------
brew install fzf
$(brew --prefix)/opt/fzf/install --all
brew install ack
brew install z
brew install tmux
brew install zsh-autosuggestions
brew install watch
brew install gh
gh alias set co --shell 'id="$(gh pr list -L100 | fzf | cut -f1)"; [ -n "$id" ] && gh pr checkout "$id"'

# Install snazzy
echo "Recommended install: Snazzy (https://github.com/sindresorhus/iterm2-snazzy)"
