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
  yarn
  ctags
  pipenv
  mercurial
  groovysdk
  awscli
)

brew install "${apps[@]}"

alias ctags="`brew --prefix`/bin/ctags"
