#!/bin/sh

current_dir=$(pwd)

# Setup soft links
ln -s $current_dir/zsh/.zshrc_custom ~/.zshrc_custom
ln -s $current_dir/vim/.vimrc ~/.vimrc
ln -s $current_dir/screen./.screenrc ~/.screenrc
ln -s $current_dir/bin/ ~/.bin
ln -s $current_dir/iterm2/profile.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/profile.json
ln -s $current_dir/.coleton ~/.coleton

# Install Oh-My-Zsh
cd ~/
curl -L http://install.ohmyz.sh | sh
echo ". ~/.zshrc_custom" | tee -a ~/.zshrc

# Setup ZSH Screen plugin
mkdir -p ~/.oh-my-zsh/custom/plugins/screen/
ln -s $current_dir/zsh/plugins/screen.plugin.zsh ~/.oh-my-zsh/custom/plugins/screen/screen.plugin.zsh

# Setup vim bundle
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/colors
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim
vim +PluginInstall +qall

# Return to current directory
cd $current_dir
