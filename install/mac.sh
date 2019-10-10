#!/usr/bin/env bash

# Install xcode utils
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup default shell to zsh
chsh -s /bin/zsh