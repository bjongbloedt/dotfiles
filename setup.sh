#!/bin/bash

cd "$HOME" || return
systemType=$(uname -s)

if[[ $systemType == "Darwin"]]; then
  echo "Running setup for Mac"
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew tap caskroom/cask
  brew install brew-cask

  brew update
  brew upgrade

  echo "Installing Git"
  brew install git
  
  echo "Installing xcode utils"
  xcode-select --install

  # Setup default shell to zsh
  chsh -s /bin/zsh

