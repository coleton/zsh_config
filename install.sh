#!/bin/sh

current_dir=$(pwd)

# Setup soft links
echo "Setting up soft links..."
ln -sfn $current_dir/zsh/.zshrc_custom ~/.zshrc_custom
ln -sfn $current_dir/vim/.vimrc ~/.vimrc
ln -sfn $current_dir/screen./.screenrc ~/.screenrc
ln -sfn $current_dir/bin/ ~/.bin
ln -sfn $current_dir/iterm2/profile.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/profile.json
ln -sfn $current_dir/.coleton ~/.coleton
ln -sfn $current_dir/git/.gitignore ~/.gitignore
cp $current_dir/git/.gitconfig ~/.gitconfig

# Replace static variables
echo "Replacing static variables..."
sed -i '' "s|\$HOME|$HOME|g" ~/.gitconfig
sed -i '' "s|ZSH_THEME=\".*\"|ZSH_THEME=\"pygmalion\"|g" ~/.zshrc
sed -i '' "s|plugins=\(.*\)|plugins=\(screen fzf\)|g" ~/.zshrc

# Install Oh-My-Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh-My-ZSH..."
  cd ~/
  curl -L http://install.ohmyz.sh | sh
  echo ". ~/.zshrc_custom" | tee -a ~/.zshrc
else
  echo "Oh-My-ZSH already installed..."
fi

if ! grep -q zshrc_custom "$HOME/.zshrc"; then
  echo ". ~/.zshrc_custom" | tee -a ~/.zshrc
fi

# Setup ZSH Screen plugin
mkdir -p ~/.oh-my-zsh/custom/plugins/screen/
ln -sfn $current_dir/zsh/plugins/screen.plugin.zsh ~/.oh-my-zsh/custom/plugins/screen/screen.plugin.zsh

# Setup vim bundle
if [[ ! -d "$HOME/.vim/bundle" ]]; then
  echo "Installing Vundle for VIM..."
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  mkdir -p ~/.vim/colors
  ln -s ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
else
  echo "Vundle already installed..."
fi

# Return to current directory
cd $current_dir
