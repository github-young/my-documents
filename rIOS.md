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
1. Config Firewall ports: WSL-ssh, jupyter, ftp, http

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

## Linux: Manjaro(Deepin)

### Before

刻盘时注意使用`` dd ``模式

### During

 - 分区时注意分一个`` /boot/efi ``分区，文件系统为`` FAT32 ``，并勾选`` boot ``和`` esp ``标签
 - 地区选上海，语言选en_US

### After

1. 配置控制中心(见`` ControlCenter.json ``)，然后注销

1. 更新
   ```shell
   sudo pacman-mirrors -i -m rank -c China
   sudo pacman -Syy
   sudo pacman -S archlinux-keyring (not sure)
   # change SigLevel to "Never" if necessary!!
   sudo pacman -Su
   ```
   然后重启

1. 添加archlinuxcn和AUR:见tuna
   ```shell
   sudo pacman -S archlinuxcn-keyring
   sudo pacman -Sy
   sudo pacman -Syy
   sudo pacman -Su
   sudo pacman -S yay
   ```
   然后重启

1. 安装和配置on-my-zsh
   1. 安装zsh
   1. 按照官网安装(oh-my-zsh)
   ```shell
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
   cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
   git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
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
   sudo pacman -S fcitx-rime
   ```
   然后`` vim $HOME/.xprofile ``，写入：
   ```shell
   export GTK_IM_MODULE=fcitx
   export QT_IM_MODULE=fcitx
   export XMODIFIERS="@im=fcitx"
   ```

## Linux (Arch+KDE) 大部分相同，下面是增量内容

### Before

```sh
dd bs=4M if=/archlinux.iso of=/dev/sdc
```

Then backup all file. Consider `` tar cvf BACKUP.tar /path ``

### During

1. Before boot: Check BIOS setting: UEFI only.
1. Before `` pacstrap ``: Check mirrorlist
1. During `` pacstrap ``: `` pacstrap linux-lts vim dhcpcd``
1. 时区选择: `` Asia/Shanghai ``
1. After `` arch-chroot ``: `` systemctl enable dhcpcd.service ``

### After

1. 使用deepin-wine-qq/tim/wechat: `` sudo pacman -S gnome-settings-daemon ``，然后设置 `` /usr/lib/gsd-xsettings `` 为开机启动
1. 中文输入法: `` sudo pacman -S fcitx fcitx-rime kcm-fcitx ``
1. (Optinal): 模仿Win10风格

## Arch Server (Step by Step) Installation & Configuration Guide

### Pre-Installation

1. Download latest Arch ISO from [TUNA](https://mirrors.tuna.tsinghua.edu.cn/).
1. Rename as "ARCH202106.iso" and move it to [Ventoy](https://github.com/ventoy/Ventoy) U-disk.
1. Prepare enough and clean disk space.
1. Open [Arch Wiki](https://wiki.archlinux.org/index.php/installation_guide) on another computer as references.

### Installation

#### Begin

1. Connect to wired connection.
1. Boot from Ventoy, choose Arch ISO.
1. Change sources to BFSU/TUNA and `` pacman -Sy ``
1. If ethernet is not OK, try `` systemd-networkd `` in [Arch Wiki](https://wiki.archlinux.org/index.php/Systemd-networkd); if still not OK, use USB T-ethering to install `` networkmanager ``, and then `` nmtui `` to delete, add and activate an ethernet connection.

#### Middle

Use `` archinstall `` to help install, or follow Arch Wiki. A few points to be noted:

1. The default `` ESP `` mountpoint is `` /boot `` and therefore `` grub-mkconfig `` should be used as: `` grub-mkconfig -o /boot/grub/grub.cfg ``
1. There is a step to input extra packages you need to install:
```shell
pacstrap -S /mnt linux-lts base base-devel vim git htop networkmanager dhcpcd openssh samba nginx caddy os-prober ntfs-3g sudo zsh nodejs cronie nvidia-lts fontconfig
pacman -S /mnt i3-wm dmenu ranger alacritty nitrogen rofi i3lock-color
# install all Chinese fonts by Arch Wiki
```

#### End

At the last step of `` archinstall ``, it will ask you whether you need to do further operations in the chroot-ed system. Confirm and do the following things:

```shell
#arch-chroot /mnt
systemctl enable dhcpcd/NetworkManager/sshd
```
then re-run grub configuration. Check the boot loader with `` efibootmgr -v ``. Then exit and reboot.

### Configuration

#### 1. First reboot --- add users

1. Login as `` root ``.
1. Edit `` /etc/ssh/sshd_config `` and change `` port ``, then `` systemctl enable sshd ``.
1. Check IP address and remember it.
1. Check and enable networkmanager: `` systemctl enable NetworkManager ``.
1. Add a normal user: `` useradd -m -G "wheel" -s /usr/bin/zsh <USERNAME> ``, and set password.
1. Change the `` wheel `` line in `` visudo ``.
1. `` reboot ``.

#### 2. Second reboot --- ssh

1. Make sure the server can be accessed via ssh.
1. Put the server at suitable place.

##### my-documents

Prepare to use my config files.

```shell
mkdir -p $HOME/Documents/repos/me && cd $HOME/Documents/repos/me
# Git configuration
git config --global user.name "<USERNAME>"
git config --global user.email "<EMAILADDRESS>"
git config --global color.ui auto
git config --global pull.rebase false
# Generate SSH key for GitHub
ssh-keygen -t ed25519 -C "<EMAILADDRESS>"
cat $HOME/.ssh/id_ed25519.pub
# Add the above SSH Key in GitHub
# Check whether successfully added
ssh -T git@github.com
```

Repeat for each user: root/\<USERNAME\>/others:

```shell
# Clone my configuration repo
mkdir -p $HOME/Documents/repos/me && cd $HOME/Documents/repos/me
git clone git@github.com:github-young/my-documents.git 
#git clone https://github.com/github-young/my-documents.git 
# Install oh-my-zsh with my configuration
cd $HOME/Documents/repos/me/my-documents/config_file/linux/scripts
./setupOMZ.sh

# cp i3 config if necessary
```

`` reboot ``

#### 3. Third reboot

##### Softwares

1. Check sources list and add archlinuxcn and AUR, see [TUNA Help](https://mirrors.tuna.tsinghua.edu.cn/help/archlinuxcn/).
1. Install the softwares in SoftwareList.

##### my-config (private repo)

Apply private configurations.

```shell
cd $HOME/Documents/repos/me/
git clone git@github.com:github-young/my-config.git
```

Then copy and modify corresponding config files in the repo.

After that, `` reboot ``.
