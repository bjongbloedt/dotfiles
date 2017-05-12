#!/usr/bin/env bash

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

apps=(
  atom
  firefox
  google-chrome
  spotify
  iterm2
)
brew cask install "${apps[@]}"
