#!/bin/bash

# Neovim ppa
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Update
sudo apt-get update

# Install all the things
sudo apt-get install git -y
sudo apt-get install ack-grep -y
sudo apt-get install neovim -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
