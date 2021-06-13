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

git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
chmod -R 755 $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
chmod -R 755 $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting

# copy config files

cp -i ../.zshrc $HOME
cp -i ../.zsh_aliases $HOME
cp ../.oh-my-zsh/themes/myrobbyrussell.zsh-theme $HOME/.oh-my-zsh/themes/robbyrussell.zsh-theme

#cp -i ../.inputrc $HOME/
ln  -s "${_WDIR}/scripts" "${HOME}/.scripts"
ln  -s "${_WDIR}/scripts/pullAll.sh" "${HOME}/Documents/repos/"

echo "[+] All done."
