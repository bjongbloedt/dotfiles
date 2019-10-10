#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

apps=(
  python
  python3
  ack
  tmux
  tmate
  httpie
  neovim/neovim/neovim
  pipenv
  awscli
)

brew install "${apps[@]}"
