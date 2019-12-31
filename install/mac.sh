#!/usr/bin/env bash

# Install xcode utils
xcode-select --install

# Install antigen
curl -L git.io/antigen > antigen.zsh

# Setup default shell to zsh
chsh -s /bin/zsh