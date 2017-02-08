#!/usr/bin/env bash

# Install xcode utils
xcode-select --install

# Install Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Update Homebrew
brew update

# Ugrade homebrew
brew upgrade

# Installations, roll out
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

# Set default editor to neovim
export EDITOR='nvim'

# Install tmuxinator
gem install tmuxinator

# command line completions

# Cleanup brew
brew cleanup
