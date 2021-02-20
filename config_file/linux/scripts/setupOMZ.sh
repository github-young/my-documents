#!/usr/bin/zsh

_WDIR="/${HOME}/Documents/repos/me/my-documents/config_file/linux"

_proceedFlag="N"
echo "[!] Install and chsh zsh first! Proceed?[y/N]:"
read _proceedFlag
if [[ ${_proceedFlag} == "N" ]]; then
  echo "[-] Abort."
  exit 1
fi

# install oh-my-zsh and plugins

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "[+] zsh installed!"

echo "[!] Copying my configurations"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
chmod -R 755 ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
chmod -R 755 ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

#cp ../.oh-my-zsh/themes/myagnoster.zsh-theme ~/.oh-my-zsh/themes/

# copy config files

cp -i ../.zshrc ~/
cp -i ../.zsh_aliases ~/

#cp -i ../.inputrc ~/
ln  -s "${_WDIR}/scripts" "${HOME}/.scripts"

echo "[+] All done."
