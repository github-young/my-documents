## 重装系统备忘录

### 写在最前
<font color='red'><b>1. 备份重要文件！</b></font>

### Windows

#### Before
用户目录下的所有个人文件夹包括但不限于：`` Desktop, Documents, Downloads, Pictures ``; `` .ssh/id_rsa* ``

#### During
检查引导模式+磁盘分区格式(UEFI+GPT)

#### After


### Linux: Deepin

#### Before
用户目录下的所有个人文件夹包括但不限于：`` Desktop, Documents, Downloads, Pictures ``; `` .ssh/id_rsa* ``

#### During

注意要分一个`` efi ``分区并在此放置bootloader

#### After

0. 切换源(tuna)
1. 设置快捷键：Super+E/X/L, Alt+T/C
1. 更新系统
1. 安装软件：见`` SoftwareList.md ``
1. 复制配置文件：见`` config_file ``
1. 复制Windows字体


### Linux: Manjaro

#### During

`` /boot/efi `` with `` boot `` and `` esp `` label.

#### After

FIRST

```shell
# change SigLevel !!
sudo pacman -Sy
sudo pacman -Syy
sudo pacman -Su
```

REBOOT

Add archlinuxcn: See tuna
```shell
sudo pacman -S archlinuxcn-keyring
sudo pacman -Sy
sudo pacman -Syy
sudo pacman -Su
```

REBOOT as necessary

Install oh-my-zsh

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
```

Config zshrc: 

```shell
ZSH_THEME="myagnoster" # comment the "context" line at the end of this theme
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
```

Install sogoupinyin

```shell
sudo pacman -S fcitx-im
sudo pacman -S fcitx-configtool
sudo pacman -S fcitx-sogoupinyin
vim ~/.xprofile
```

Write in:

```shell
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
```
