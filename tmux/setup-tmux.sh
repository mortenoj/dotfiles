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

config_dir=$(pwd)

echo "Installing oh-my-tmux config"

cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

cd $config_dir

cp ./.tmux.conf.local $HOME/

echo "Copying tmuxinator configs"
mkdir -p $HOME/.config/tmuxinator
cp -r ./tmuxinator-configs $HOME/.config/tmuxinator
