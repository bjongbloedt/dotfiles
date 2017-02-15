#!/usr/bin/env bash

# Install xcode utils
xcode-select --install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update Homebrew
brew update

# Ugrade homebrew
brew upgrade

# Installations, roll out
brew install python
brew install ack
brew install docker
brew install docker-machine-driver-xhyve
brew install tmux
brew install tmate
brew install httpie
brew install neovim/neovim/neovim
brew install nvm

# into the caskroom
brew tap caskroom/cask
brew cask install atom
brew cask install firefox
brew cask install google-chrome
brew cask install spotify

# Set default editor to neovim
export EDITOR='nvim'

# Install tmuxinator
gem install tmuxinator

# command line completions

# Cleanup brew
brew cleanup
