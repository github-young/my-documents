#!/usr/bin/zsh

_WDIR="${HOME}/Documents/repos/me/my-documents/config_file/linux"
_VIMRC_DIR="${HOME}/.vim"
echo "HOME: ${HOME}"
echo "WDIR: ${_WDIR}"

# Prompt for confirmation

_proceedFlag="N"
echo "[!] Install and chsh zsh first! Proceed?[y/N]:"
read _proceedFlag
if [[ ${_proceedFlag} != "y" ]]; then
  echo "[-] Abort."
  exit 1
fi

# Install oh-my-zsh and plugins

if [[ -z `command -v omz` ]]; then
  echo "OMZ not installed; installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/plugins/zsh-autosuggestions
  #chmod -R 755 ${HOME}/.oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting
  #chmod -R 755 ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting
else
  echo "OMZ already installed, skipping..."
fi

echo "[+] OMZ & plugins installed!"

# Copy config files

echo "[!] Copying my configurations"
cp -i ${_WDIR}/.zshrc ${HOME}/
cp -i ${_WDIR}/.zsh_aliases ${HOME}/
cp -i ${_WDIR}/.oh-my-zsh/themes/myrobbyrussell.zsh-theme ${HOME}/.oh-my-zsh/themes/
cp -i ${_WDIR}/.oh-my-zsh/themes/myagnoster.zsh-theme ${HOME}/.oh-my-zsh/themes/

#cp -i ${_WDIR}/.inputrc ${HOME}/
ln -isT "${_WDIR}/scripts" "${HOME}/.scripts"
ln -is "${_WDIR}/scripts/pullAll.sh" "${HOME}/Documents/repos/"

# copy vim/nvim configs
mkdir -p ${HOME}/.vim/colors/
#mkdir -p ${HOME}/.config/nvim
#mkdir -p ${HOME}/.local/share/nvim/
cp -i ${_WDIR}/etc/vim/vimrc ${_VIMRC_DIR}/ 
cp -i ${_WDIR}/etc/vim/coc.nvim.rc ${_VIMRC_DIR}/
cp -i ${_WDIR}/etc/vim/molokai.vim ${_VIMRC_DIR}/colors/

echo "[+] All done."
