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
