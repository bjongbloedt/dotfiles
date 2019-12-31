#!/bin/bash
# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

# Reload zshrc to enable nvm
source ~/.zshrc

# Install lts version of node
nvm install --lts
nvm use --lts

