#!/bin/bash

# Neovim ppa
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Yarn ppa
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Update
sudo apt-get update

# Install all the things
sudo apt-get install ack-grep -y
sudo apt-get install neovim -y
sudo apt-get install tmux -y
sudo apt-get install python-pip -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
sudo apt-get install yarn -y
