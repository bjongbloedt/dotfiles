#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Config file locations for symlinks
mkdir -p ~/.config/nvim
mkdir -p ~/.config/kitty
mkdir -p ~/.config/alacritty

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
ln -sfv "$DOTFILES_DIR/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml

# Packages
if [ "$(uname)" == "Linux" ]; then
  echo "Installing packages for linux"
  # Non classic installs
  snap install docker

  # The others
  snap install code --classic
  snap install pycharm-professional --classic
  snap install datagrip --classic
  snap install intellij-idea-ultimate --classic
  snap install tmux --classic
  snap install nvim --classic
fi

if [ "$(uname)" == "Darwin" ]; then
  echo "Installing packages for mac"
  
  echo "Install xcode utils"
  xcode-select --install

  echo "Install Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew update
  brew upgrade

  echo "Installing brew apps"
  apps=(
    python3
    ack
    httpie
    neovim/neovim/neovim
    pyenv
    poetry
    pipenv
    awscli
    tmux
  )
  brew install "${apps[@]}"

  echo "Installing brew cask apps"
  cask_apps=(
    firefox
    spotify
    docker
    alacritty
    tunnelblick
    joplin
    jetbrains-toolbox
    vscodium
    visualvm
  )

  brew cask install "${cask_apps[@]}"
  
  echo "Setup SDKMan"
  [ ! -d "$HOME/.sdkman" ] && curl -s "https://get.sdkman.io" | bash
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
