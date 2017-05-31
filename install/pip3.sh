#!/usr/bin/env bash

apps=(
  virtualenv
  virtualenvwrapper
  tmuxp
  neovim
)

pip3 install "${apps[@]}"
