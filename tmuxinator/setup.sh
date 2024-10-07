# Install homebrew, if not installed
if [[ $(command -v tmuxinator) == "" ]]; then
    echo "tmux not found, installing"
    if [[ $(command -v brew) == "" ]]; then
        echo "homebrew not installed, installing"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    brew install tmuxinator
fi

echo "Copying tmuxinator configs"

mkdir -p $HOME/.config/tmuxinator
cp -r ./tmuxinator-configs $HOME/.config/tmuxinator/
