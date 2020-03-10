#!/bin/sh

path=$(pwd)
cp ./.vimrc ~/.vimrc
cd ~/
curl -L http://install.ohmyz.sh | sh
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="pygmalion"/' ~/.zshrc
echo 'export TERM=xterm-256color' | tee -a ~/.zshrc
echo 'termcapinfo xterm-color|xterm|xterms|xs|rxvt ti@:te@' | tee -a ~/.screenrc
echo 'bce "on"' | tee -a ~/.screenrc
echo 'defbce "on"' | tee -a ~/.screenrc
echo 'defencoding "UTF-8"' | tee -a ~/.screenrc
echo 'export TERM=xterm-256color' | tee -a ~/.screenrc
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
mkdir -p ~/.oh-my-zsh/custom/plugins/screen/
cd $path
cp ./screen.plugin.zsh ~/.oh-my-zsh/custom/plugins/screen/screen.plugin.zsh
sed -i 's/^plugins=(/plugins=(screen /' ~/.zshrc
cp -r .coleton ~/
echo ". ~/.coleton/init" | tee -a ~/.zshrc
cp ./bin/* /usr/local/bin
cp ./iterm2-profile.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/
