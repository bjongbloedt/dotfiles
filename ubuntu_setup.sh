#!/bin/bash

# Neovim ppa
sudo apt-get install software-properties-common -y
sudo apt-get install python-software-properties -y
sudo add-apt-repository ppa:neovim-ppa/stable

# Update
sudo apt-get update

# Install all the things
sudo apt-get install tmux -y
sudo apt-get install curl -y
sudo apt-get install httpie -y
sudo apt-get install ack-grep -y
sudo apt-get install neovim -y
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Symlink the configs
ln -sf ./gitconfig ~/.gitconfig
ln -sf ./gitignore ~/.gitignore
ln -sf ./tmux/tmux.conf ~/.tmux.conf
ln -sf ./ctags ~/.ctags
ln -sf ./neovim/init.vim ~/.config/nvim/init.vim
ln -sf ./zsh/zshrc ~/.zshrc
ln -sf ./bash/bash_profile ~/.bash_profile
ln -sf ./bash/bashrc ~/.bashrc
