#!/bin/bash
# Automatically copy profiles into corresponding path.

# shells
cp -y .zshrc ~/
cp -y .zsh_aliases ~/
cp -y .bashrc ~/
cp -y .bash_aliases ~/

# other files in ~
cp -y .xprofile ~/
cp -y .inputrc ~/
cp -y rmtexfiles.sh ~/

# vim
sudo cp etc/vim/vimrc /etc/vimrc

# vscode
cp -y ../vscode/config/Code/User/settings.json ~/.config/Code/User/
cp -y ../vscode/config/Code/User/keybindings.json ~/.config/Code/User/
cp -y ../vscode/config/Code/User/locale.json ~/.config/Code/User/
cp -y ../vscode/vscode/extensions/james/snippets/latex.json ~/.vscode/extensions/james*/snippets/
