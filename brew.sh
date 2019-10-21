#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install zsh

# Add oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew install tmux
brew tap homebrew/versions
brew install bash-completion@2

# Install tools
brew install tmux
brew install htop
brew install git
brew install libjpeg
brew install the_silver_searcher  # ag
brew install ctags
brew install cmake
brew install neovim/neovim/eeovim

# Install Python 2+3
brew install python@2
brew install python3

# Remove outdated versions from the cellar.
brew cleanup
