#!/bin/sh

# Install homebrew, if not installed
if [[ $(command -v tmux) == "" ]]; then
    echo "tmux not found, installing"
    if [[ $(command -v brew) == "" ]]; then
        echo "homebrew not installed, installing"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew install tmux
fi

cp ./.tmux.conf $HOME/
