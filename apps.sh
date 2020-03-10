#!/bin/sh

if [[ $(command -v rvm) == "" ]]; then
  echo "Installing Ruby Version Manager..."
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

if [[ $(command -v brew) == "" ]]; then
  echo "Installing Hombrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Updating Homebrew..."
  brew update
fi

brew install tree
brew install ack
brew install cask iterm2
brew install cask atom
brew install go
brew install cask burp-suite
brew install cask rubymine
brew install cask goland
brew install cask webstorm