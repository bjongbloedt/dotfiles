#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlinks
ln -sfv "$DOTFILES_DIR/git/gitconfig" ~/.gitconfig
ln -sfv "$DOTFILES_DIR/git/gitignore" ~/.gitignore
ln -sfv "$DOTFILES_DIR/tmux/tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/neovim/init.vim" ~/.config/nvim/init.vim
ln -sfv "$DOTFILES_DIR/zsh/zshrc" ~/.zshrc
ln -sfv "$DOTFILES_DIR/bash/bash_profile" ~/.bash_profile
ln -sfv "$DOTFILES_DIR/bash/bashrc" ~/.bashrc
ln -sfv "$DOTFILES_DIR/hg/hgrc" ~/.hgrc
ln -sfv "$DOTFILES_DIR/kitty/kitty.conf" ~/.config/kitty/kitty.conf

# Packages
if [ "$(uname)" == "Linux" ]; then
  echo "Installing packages for linux"
fi

if [ "$(uname)" == "Darwin" ]; then
  echo "Installing packages for darwin"
fi
