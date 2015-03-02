#!/bin/sh

path=$(pwd)
cp ./.vimrc ~/.vimrc
cd ~/
curl -L http://install.ohmyz.sh | sh
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="pygmalion"/' ~/.zshrc
echo 'alias c="clear"' | tee -a ~/.zshrc
echo 'alias e="exit"' | tee -a ~/.zshrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.oh-my-zsh/custom/plugins/screen/
cp ./screen.plugin.zsh ~/.oh-my-zsh/custom/plugins/screen/screen.plugin.zsh
sed -i 's/^plugins=(/plugins=(screen /' ~/.zshrc
