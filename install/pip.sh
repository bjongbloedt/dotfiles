#!/usr/bin/env bash

apps=(
  virtualenv
  virtualenvwrapper
  tmuxp
)

pip install "${apps[@]}"
