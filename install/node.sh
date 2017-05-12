#!/bin/bash
# Download and install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# Reload zshrc to enable nvm
source ~/.zshrc

# Install lts version of node
nvm install --lts
nvm use --lts

