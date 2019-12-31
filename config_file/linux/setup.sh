#!/bin/bash
# Automatically copy profiles into corresponding path.

# Setup zsh
./setupOMZ.sh

# other files in ~
cp -y .xprofile ~/
cp -y rmtexfiles.sh ~/

# vim
cp etc/vim/vimrc ~/.vim/vimrc

# vscode
cp -y ../vscode/config/Code/User/settings.json ~/.config/Code/User/
cp -y ../vscode/config/Code/User/keybindings.json ~/.config/Code/User/
cp -y ../vscode/config/Code/User/locale.json ~/.config/Code/User/
cp -y ../vscode/vscode/extensions/james/snippets/latex.json ~/.vscode/extensions/james*/snippets/
