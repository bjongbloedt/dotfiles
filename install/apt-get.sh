#!/bin/bash

# Neovim ppa
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

# Update
sudo apt-get update

# Install all the things
sudo apt-get install ack-grep -y
sudo apt-get install neovim -y
sudo apt-get install tmux -y
sudo apt-get install python-pip -y
