# 重装系统备忘录

## 写在最前

**备份重要文件！**

---

## Windows

### Before
用户目录下的所有个人文件夹包括但不限于：`` Desktop, Documents, Downloads, Pictures ``; `` .ssh/id_rsa* ``，浏览器收藏夹同步

### During
检查引导模式+磁盘分区格式(UEFI+GPT)

### After

---

## Linux: Deepin

### Before
用户目录下的所有个人文件夹包括但不限于：`` Desktop, Documents, Downloads, Pictures ``; `` .ssh/id_rsa* ``，Firefox同步，Mendeley迁移准备

### During

注意要分一个`` efi ``分区并在此放置bootloader

### After

0. 切换源(tuna)
1. 设置控制中心的设置（见`` controlcenter.json ``）
1. 设置快捷键：Super+E/X/L/Z, Alt+T/C
   看`` /usr/share/applications/dde-control-center.desktop ``里面的exec的写法，配置控制中心
1. 更新系统
1. 安装软件：见`` SoftwareList.md ``
1. 复制配置文件：见`` config_file ``
1. 复制Windows字体并安装，和powerline字体。

---

## Linux: Manjaro

### Before

刻盘时注意使用`` dd ``模式

### During

 - 分区时注意分一个`` /boot/efi ``分区，并勾选`` boot ``和`` esp ``标签
 - 地区选上海，语言选en_US

### After

1. 配置控制中心，然后注销

1. 更新
   ```shell
   sudo pacman-mirrors -i -m rank -c China
   sudo pacman -Syy
   sudo pacman -S archlinux-keyring (not sure)
   # change SigLevel if necessary!!
   sudo pacman -Su
   ```
   然后重启

1. 添加archlinuxcn和AUR:，见tuna
   ```shell
   sudo pacman -S archlinuxcn-keyring
   sudo pacman -Sy
   sudo pacman -Syy
   sudo pacman -Su
   ```
   然后重启

1. 安装和配置on-my-zsh
   1. 按照官网安装
   ```shell
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
   ```

   1. 配置zshrc: 
   ```shell
   ZSH_THEME="myagnoster" # comment the "context" line at the end of this theme
   plugins=(
     git
   zsh-syntax-highlighting
   zsh-autosuggestions
   )
   ```

1. 输入法
   ```shell
   sudo pacman -S fcitx-im
   sudo pacman -S fcitx-configtool
   sudo pacman -S fcitx-sogoupinyin (or rime)
   ```
   然后`` vim ~/.xprofile ``，写入：
   ```shell
   export GTK_IM_MODULE=fcitx
   export QT_IM_MODULE=fcitx
   export XMODIFIERS="@im=fcitx"
   ```
