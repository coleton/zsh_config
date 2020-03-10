#!/bin/sh

current_dir=$(pwd)

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

cd $current_dir/brew/
brew bundle