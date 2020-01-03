#!/bin/bash

echo "[!] Install and chsh zsh first!"

# install oh-my-zsh and plugins

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "[+] zsh installed!"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
chmod -R 755 ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
chmod -R 755 ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

cp ../.oh-my-zsh/themes/myagnoster.zsh-theme ~/.oh-my-zsh/themes/

# copy config files

cp -i ../.zshrc ~/
cp -i ../.zsh_aliases ~/
cp -i ../.bashrc ~/
cp -i ../.bash_aliases ~/

# copy other files

cp -i ../.inputrc ~/
