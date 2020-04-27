#!/bin/sh

current_dir=$(pwd)

# Install RVM
if [[ $(command -v rvm) == "" ]]; then
  echo "Installing Ruby Version Manager..."
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi

# Install Homebrew
if [[ $(command -v brew) == "" ]]; then
  echo "Installing Hombrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Updating Homebrew..."
  brew update
fi

# Setup brewed apps
cd $current_dir/brew/
brew bundle

# Install commitizen
npm install -g commitizen
npm install -g cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc