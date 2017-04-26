#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

apps=(
  python
  ack
  docker
  docker-machine-driver-xhyve
  tmux
  tmate
  httpie
  neovim/neovim/neovim
  nvm
)

brew install "${apps[@]}"
