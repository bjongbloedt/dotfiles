#!/usr/bin/env bash

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

apps=(
  firefox
  spotify
  docker
  dotnet-sdk
)
brew cask install "${apps[@]}"
