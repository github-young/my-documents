# Arch Server (Step by Step) Installation & Configuration Guide

## Installation (with ``archinstall`` script)

### Pre-Installation

1. Download latest Arch ISO from [TUNA](https://mirrors.tuna.tsinghua.edu.cn/).
1. Move it to [Ventoy](https://github.com/ventoy/Ventoy) U-disk.
1. Prepare enough and clean disk space.
1. Open [Arch Wiki](https://wiki.archlinux.org/index.php/installation_guide) on another computer as references.

### Begin

1. Connect to wired/WLAN connection.
1. Boot from Ventoy, choose Arch ISO.
1. Change sources to BFSU/TUNA and `` pacman -Sy ``
1. If ethernet is not OK, try `` systemd-networkd `` in [Arch Wiki](https://wiki.archlinux.org/index.php/Systemd-networkd); if still not OK, use USB T-ethering to install `` networkmanager ``, and then `` nmtui `` to delete, add and activate an ethernet connection.

### Middle

Use `` archinstall `` to help install, or follow Arch Wiki. A few points to be noted:

1. The default `` ESP `` mountpoint is `` /boot `` and therefore `` grub-mkconfig `` should be used as: `` grub-mkconfig -o /boot/grub/grub.cfg ``
1. There is a step to input extra packages you need to install:
```shell

# for all
pacstrap -S /mnt linux-lts base base-devel vim git htop networkmanager dhcpcd openssh sudo zsh nodejs cronie fontconfig fakeroot debugedit

# for server
pacstrap -S samba nginx caddy os-prober ntfs-3g
```

### End

At the last step of `` archinstall ``, it will ask you whether you need to do further operations in the chroot-ed system. Confirm and do the following things:

```shell
#arch-chroot /mnt
systemctl enable dhcpcd/NetworkManager/sshd

# for DE with sway and kde
pacman -S sway plasma konsole dolphin fcitx5-rime autotiling network-manager-applet imv swaybg swayimg kanshi
```
then re-run grub configuration. Check the boot loader with `` efibootmgr -v ``. Then exit and reboot.


## Configuration

### 1. First reboot --- ssh

1. Make sure the server can be accessed via ssh.
1. Put the server at suitable place.

#### my-documents

Prepare to use my config files.

```shell
mkdir -p $HOME/Documents/repos/me && cd $HOME/Documents/repos/me
# Git configuration
git config --global user.name "<USERNAME>"
git config --global user.email "<EMAILADDRESS>"
git config --global color.ui auto
git config --global pull.rebase false
# Generate SSH key for GitHub
ssh-keygen -t ed25519 -C "<HOSTNAME>"
cat $HOME/.ssh/id_ed25519.pub
# Add the above SSH Key in GitHub
# Check whether successfully added
ssh -T git@github.com
```

Repeat for each user: root/\<USERNAME\>/others:

```shell
# Clone my configuration repo
mkdir -p $HOME/Documents/repos/me && cd $HOME/Documents/repos/me
# git clone git@github.com:github-young/my-documents.git 
git clone https://github.com/github-young/my-documents.git 
# Install oh-my-zsh with my configuration
cd $HOME/Documents/repos/me/my-documents/config_file/linux/scripts
./setupNewInstall.sh
```

`` reboot ``

### 2. Second reboot

#### Softwares

1. Check sources list and add archlinuxcn and AUR, see [TUNA Help](https://mirrors.tuna.tsinghua.edu.cn/help/archlinuxcn/).
1. Install the softwares in SoftwareList. Especially:
```shell
sudo pacman -Syu kanshi seafile-client
paru -S swaysome
sudo pacman -S python-pipx
pipx install commitizen
```
1. Install all Chinese fonts by Arch Wiki

#### my-config (private repo)

Apply private configurations.

```shell
cd $HOME/Documents/repos/me/
git clone git@github.com:github-young/my-config.git
```

Then copy and modify corresponding config files in the repo.

After that, `` reboot ``.
