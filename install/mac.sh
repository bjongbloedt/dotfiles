#!/usr/bin/env bash

# Install xcode utils
xcode-select --install

# Setup default shell to zsh
chsh -s /bin/zsh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew install brew-cask

brew update
brew upgrade

apps=(
  python
  python3
  ack
  httpie
  neovim/neovim/neovim
  pipenv
  awscli
  kitty
)
brew install "${apps[@]}"

cask_apps=(
  firefox
  spotify
  docker
)

brew cask install "${apps[@]}"