## 日常笔记

1. 包管理器报错：
   - yum: 
      ```sh
      sudo rm -rf /var/run/yum.pid
      ```
   - apt: 
      ```sh
      sudo rm /var/cache/apt/archives/lock
      sudo rm /var/lib/dpkg/lock
      ```

1. touchpad:
   ```sh
   synclient TapButton1=1
   ```

1. g++:
   ```sh
   g++ filename.cpp -o filename
   ```

1. Install VMD:
   ```sh
   tar xvf vmd_xxx.tar.gz
   ./configure LINUX(or LINUXAMD64)
   ./confgiure
   cd src
   sudo make install
   ```

1. 输入法图标消失怎么办？
   ```sh
   kill all ibus-daemon #（结束进程）
   ibus-daemon -d #（重启ibus）
   ```

1. 卸载已安装的rpm包:
   ```sh
   sudo rpm -e --nodeps xxx
   ```

1. ubuntu亮度:
   ```sh
   sudo vim /etc/default/grub
   GRUB_CMDLINE_LINUX="acpi_osi=Linux acpi_backlight=vendor"
   sudo update-grub(dangerous!)
   sudo reboot
   ```

1. 命令行上网
   ```sh
   curl http://p.nju.edu.cn/portal_io/login -d username=xxxxxxxxx -d password=xxxxxxxx
   curl http://p.nju.edu.cn/portal_io/logout
   sudo apt install w3m w3m-img
   w3m URL
   ```

1. Install sogou input method:
   1. download sogou_xxx.deb and use gdebi to install / use the ubuntu software center
   1. ``fcitx-config-gtk3``
   1. ``im-config``, choose 'fcitx'
   - 或：[Here](https://blog.csdn.net/lupengCSDN/article/details/80279177)

1. matlab2016b的安装：
   1. 在图形界面下双击iso1，可以自己建文件夹也可以用默认的
   1. 记得要 ``sudo`` 运行安装脚本
   1. 安装到iso1结束时，直接unmount iso1，双击打开iso2
   1. 安装结束后，要把matlab添加到启动器：``sudo vim /usr/share/applications/matlab.desktop``，写入以下内容：
      ```sh
      [Desktop Entry]
      Name=matlab
      Comment=matlab
      Exec=/usr/local/Mathworks/MATLAB/R2016b/bin/matlab -desktop
      Icon=/usr/local/Mathworks/MATLAB/R2016b/toolbox/nnet/nnresource/icons/matlab.png
      Type=Application
      Terminal=false
      Categories=Application
      Encoding=UTF-8
      StartupNotify=true
      ```

1. 单击图标最小化：
   ```sh
   gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
   ```
   - 现在用gnome-twaek-tools即可。

1. 命令行广播：
   1. record and replay:
      ```sh
      #record: 
      script -t 2> timing.log output.session
      #type you cmds, use 'exit' to terminate
      
      #replay: 
      scriptreplay timing.log output.session
      ```
   
   1. real-time broadcasting:
      ```sh
      #in terminal 1(broadcaster)
      mkfifo scriptfifo
      #in terminal 2(audience)
      cat scriptfifo
      #in terminal 1(broadcaster)
      script -f scriptfifo 
      #type your cmds, use 'exit' to terminate
      ```

1. 生成大文件
   ```sh
   dd if=/dev/zero of=junk.data bs=1M count=1
   ```

1. kill进程：
   ```sh
   sudo kill -s 9 pid
   ```

1. crossover crack:
   - 下载：[https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_16.2.0-1.deb](https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_16.2.0-1.deb)
   - 安装
   - 把这个winewrapper.exe.so替换``/opt/cxoffice/lib/wine/``的那个so

1. 搭建ftp服务器的防火墙设置(if necessary)：
   ```sh
   iptables -I INPUT -p tcp --dport 20 -j ACCEPT
   iptables -I INPUT -p tcp --dport 21 -j ACCEPT
   ```

1. centos关闭图形界面：
   ```sh
   sudo vim /etc/inittab #line 12-14, modify as below:
   #ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target (这是默认开机图形界面)
   #ln -sf /lib/systemd/system/multiuser.target /etc/systemd/system/default.target (这是默认开机命令行界面)
   ```

1. save power:
   ```sh
   sudo apt install tlp cpufrequtils
   ```

1. gedit run python plugin:
   ```sh
   #!/bin/bash
   gnome-terminal -x $SHELL -ic "python $GEDIT_DOCUMENTS_PATH; printf \"\nPress any key to continue.\"; read -n 1 -s"
   #set +m
   #bash -i python $GEDIT_DOCUMENTS_PATH
   ```

1. Windows cmd alias:
   注册表找到``HKEY_LOCAL_MACHINE\Software\Microsoft\Command Processor``，右键``新建``-``字符串值``，名为``AutoRun``，值为``C:\cmd-alias.bat``，保存退出。

1. python matplotlib.pyplot中文:
   ```python
   pl.rcParams['font.sans-serif']=['SimHei']
   pl.rcParams['axes.unicode_minus']=False
   ```
   或者
   ```python
   from matplotlib.font_manager import FontProperties as FP
   font = FP(fname=r"C:\D\simsun_pc6.ttf", size=14)
   pl.plot(x,y,fontproperties=font)
   ```

1. scoop:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -scope CurrentUser
   iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
   ```

1. 制作iso文件：
   ```sh
   #install mkisofs
   # -m means exclude some file
   # -J is related with Windows. See the manual.
   mkisofs -J (-m SomeDirectory/Useless.txt) -o OutputFile.iso inputDir/
   # Or (from: https://blog.csdn.net/Happy_Sunshine_Boy/article/details/89511973)
   mkisofs -l -J -R -allow-leading-dots -r -v -hide-rr-moved -o output.iso inputDir/
   ```

1. WSL path:
   ``C:\Users\username\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs``

1. Windows change right-click PowerShell
   1. regedit: `` Computer\HKEY_CLASSES_ROOT\Directory\Background\shell\Powershell\command ``
   1. right-click `` command ``-`` Permission ``-`` advanced ``
   1. (optional), 如果你的所有者为`` TrustedInstaller ``，那么首先点击上方``更改``，将当前用户账户名添加进去。完成后，再在下方将当前用户的权限从``读取``改为``完全控制``即可。这样就可以正常修改注册表键值了
   1. 将右侧默认字符串值改为`` cmd.exe /s /k pushd "%V" ``，确定保存即可
   1. 如果要改回去，只要把以上键值改回以下键值即可，注意不含两侧引号: `` powershell.exe -noexit -command Set-Location -literalPath '%V' ``

1. 保持远程连接的任务：
   nohup, screen

1. Ubuntu/Deepin的TeXLive：
   1. 如果是我自己用，推荐 `` sudo apt install texlive-full `` 完事。虽然观察到vscode的格式化文件不能用，但是考虑到修复这个bug的时间成本，我宁可不用这个功能。
   但是没有tlmgr包管理器，有点不方便。
   (中文问题：下载ctex宏包放到``/usr/share/texmf/tex/latex``里面，解压，然后``sudo texhash``)
   1. 如果一定要用texlive的iso。那么安装完了，首先试一下中文行不行，不行的话，要把Windows上的几种主要中文字体复制到 `` /etc/fonts/winfonts `` 下，然后执行：
      ```sh
      sudo chmod 644 winfonts
      sudo mkfontdir
      sudo mkfontscale
      sudo fc-cache -fv
      ```
      刷新字体缓存。这一步的目的是使texlive支持中文。下一步才来解决格式化文件的问题。点一下格式化文件，查看LaTeX Workshop的输出，应该是缺少一些perl的工具，执行：
      ```sh
      sudo perl -MCPAN -e shell
      ```
      进入perl的shell，然后按缺失的包的名字安装。
      ```perl
      install Log::Log4perl
      install Log::Dispatch::File
      install YAML::Tiny
      install File::HomeDir
      install Unicode::GCString
      ```
      这样这个bug就修好了。参考[这里](https://github.com/James-Yu/LaTeX-Workshop/issues/376)

1. Sublime的插件：
   package control的官网被墙了。那么只能离线安装，离线安装文件放在 `` Installed Packages `` 里面。其它的插件(LaTeXTools、LaTeX-cwl)都可以按照github的说明离线安装，记得在User文件夹里新建一个叫cwl的文件夹，然后把clone到的LaTeX-cwl里的cwl文件放进去即可。

1. 正则表达式查找中文字符：
   `` [\u4e00-\u9fa5] ``

1. 统计tex的字数：
   `` texcount tex.tex ``

1. deepin的Fn功能键问题：
   安装/使用xmodmap，配置文件见config

1. linux init exec shell crpits:
   1. `` sudo chmox +x /etc/init.d/xxx.sh ``
   1. `` sudo ln -s /etc/init.d/xxx.sh /etc/rc.d/ ``

1. 预防内存泄露卡死
   1. `` sudo apt install earlyoom ``
   1. 修改`` /etc/sysctl.conf ``中`` kernel.sysrq=1 ``

1. Deepin安装Docker-ce：
   参考[Deepin Wiki](https://wiki.deepin.org/wiki/Docker)。
   安装
   ```sh
   sudo apt remove docker.io docker-engine
   sudo apt install apt-transport-https ca-certificates curl python-software-properties software-properties-common
   curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add - #OR:
   #curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
   #test gpg
   sudo apt-key fingerprint 0EBFCD88
   sudo add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian stretch stable" #NOTE: cat /etc/debian_version & convert number to codename
   sudo apt update
   sudo apt install docker-ce
   ```
   测试：
   ```sehll
   docker version
   sudo docker run hello-world
   sudo usermod -aG docker $USER
   ```
   配置docker-cn镜像源：
   ```sh
   sudo vim /etc/docker/daemon.json
   ```
   写入：
   ```json
   {
       "registry-mirrors": ["https://registry.docker-cn.com"]
   }
   ```
   然后重启相关服务：
   ```sh
   sudo systemctl daemon-reload
   sudo systemctl restart docker
   ```

1. 安装hexo报错：
   ```sh
   sudo npm install --unsafe-perm --verbose -y hexo-cli
   ```

1. 手动redshift：
   ```sh
   redshift -l 32.05:118.766 -t 5500:3500
   ```

1. dict字典
   1. For debian/ubuntu/deepin:
   ```sh
   sudo apt install dict dictd
   sudo cp langdao-* /usr/share/dictd/
   sudo vim /var/lib/dictd/db.list
   ```
   写入
   ```
   database langdao-ce {
     data  /usr/share/dictd/langdao-ce.dict.dz
     index /usr/share/dictd/langdao-ce.index
   }
   database langdao-ec {
     data  /usr/share/dictd/langdao-ec.dict.dz
     index /usr/share/dictd/langdao-ec.index
   }
   ```
   然后重启dictd服务。
   ```sh
   sudo systemctl restart dictd.service
   sudo systemctl enable dictd.service # Optional
   ```

   1. For Manjaro (See [Arch Wiki page](https://wiki.archlinux.org/index.php/Dictd))
   ```sh
   sudo pacman -S dictd
   sudo cp langdao* /usr/share/dictd/
   sudo vim /etc/dict/dictd.conf
   ```
   写入
   ```
   database langdao-ce  { data  "/usr/share/dictd/langdao-ce.dict.dz"
                          index "/usr/share/dictd/langdao-ce.index"  }
   database langdao-ec  { data  "/usr/share/dictd/langdao-ec.dict.dz"
                          index "/usr/share/dictd/langdao-ec.index"  }
   ```
   然后重启dictd服务。

1. conda的spyder添加到快捷方式：
   ```sh
   sudo vim /usr/share/applications/spyder3.desktop
   # and add:
   [Desktop Entry]
   Comment=Spyder3 from Conda
   Exec=/home/young/miniconda3/bin/spyder
   Encoding=UTF-8
   GenericName=Spyder3
   Name=Spyder3
   StartupNotify=true
   Terminal=false
   Type=Application
   Categories=Development;
   Icon=/home/young/miniconda3/pkgs/spyder-3.3.4-py37_0/share/icons/spyder3.png
   ```

1. Linux压缩图片大小
   ```sh
   # install imagemagick
   convert -quality 75 xxx.jpg xxx.jpg
   ```
1. Manjaro安装Mathematica无法启动：
   ```sh
   cd /usr/local/Wolfram/Mathematica/11.3/SystemFiles/Libraries/Linux-x86-64
   sudo mv libfreetype.so.6 libgreetype.so.6.bak
   sudo mv libz.so.1 libz.so.1.bak
   ```
1. Manjaro的Java版本：
   ```sh
   which/where/whereis java
   sudo ln -s $JAVA_12_PATH $CURRENT_JAVA_PATH_LINK
   ```
1. Coursera视频无法播放：
   改hosts：
   ```
   52.84.246.90 d3c33hcgiwev3.cloudfront.net
   52.84.246.252 d3c33hcgiwev3.cloudfront.net
   52.84.246.144 d3c33hcgiwev3.cloudfront.net
   52.84.246.72 d3c33hcgiwev3.cloudfront.net
   52.84.246.106 d3c33hcgiwev3.cloudfront.net
   52.84.246.135 d3c33hcgiwev3.cloudfront.net
   52.84.246.114 d3c33hcgiwev3.cloudfront.net
   52.84.246.90 d3c33hcgiwev3.cloudfront.net
   52.84.246.227 d3c33hcgiwev3.cloudfront.net
   ```
   然后刷新DNS缓存：
   ```sh
   sudo systemctl restart nscd.service
   ```
1. 解决WPS流氓占用pdf文件图标的问题：
   ```sh
   sudo vim /usr/share/mime/packages/wps-office-pdf.xml
   ```
   ~~把其中的3个相应位置修改为如下：~~
   ```xml
   <mime-type type="application/pdf">         #(1)
      <comment>Microsoft Word</comment>
      <sub-class-of type="application/pdf"/>  #(2)
      <generic-icon name="org.gnome.Evince"/> #(3)
      <glob pattern="*.pdf" weight="80"/>
   </mime-type>
   ```
   直接删除或重命名上述wps文件，
   然后刷新MIME缓存：
   ```sh
   sudo update-mime-database /usr/share/mime
   ```

1. Manjaro清理垃圾：
   ```sh
   sudo pacman -Rsn $(pacman -Qdtq)
   sudo pacman -Scc
   sudo rm /var/lib/systemd/coredump/.
   sudo journalctl --vacuum-size=50M
   ```

1. Linux下查看Windows的txt乱码：
   ```sh
   iconv -f gbk -tutf8 in.txt > out.txt
   ```

1. Linux下卸载/安装显卡驱动：
   ```sh
   sudo mhwd -r pci video-linux # (or) video-vesa
   sudo mhwd -i pci video-linux
   ```

1. Manjaro下更新Anaconda报错`` file exits in xxx ``：
   ```sh
   sudo rm -rf /opt/anaconda
   sudo pacman -S anaconda # (optinal) --overwrite /opt/anaconda
   ```

1. Disable Beep in Linux TTY:
   ```sh
   sudo rmmod pcspkr
   ```

1. SSHFS:
   ```sh
   sudo sshfs -o allow_other,default_permission -p portNumber username@hostname:/remote/path/ /mnt/local/mount/point/
   ```

1. firefox zoom:
   about:config>>zoom>>max/min(160/120)

1. linux mount NTFS disk:
   ```sh
   sudo mount -t ntfs -o rw,auto,user,fmask=0133,dmask=0022 /dev/sdxn /path2mnt
   mount --bind oldPath newPath
   # for crontab
   # @reboot mount -o uid=1000,gid=1000,dmask=022,fmask=133 /dev/sda1 /mnt/HDD && mount --bind /mnt/HDD/xy/data/downloads /home/yxucn/Downloads/ftp/mnt/xy/data/downloads
   ```

1. DDE锁屏模糊问题：
   ```sh
   sudo rm /var/cache/image-blur/*.jpg
   ```
   然后设置一次锁屏，该目录下会出现一个模糊化的图片：`` xxx.jpg ``。
   ```sh
   sudo cp originalPicture /var/cache/image-blur/xxx.jpg
   #(optinal) sudo chattr +i xxx.jpg
   ```
   注销，重新登录即可。

1. tty界面下旋转屏幕
   ```sh
   echo 3 > /sys/class/graphics/fbcon/rotate_all
   ```

1. ssh免密码登录+git共存：
   1. git原样配置不变
   1. ssh：
      ```sh
      ssh-keygen -t dsa # and save as default
      ssh-copy-id -i id_dsa.pub username@server
      ssh-add id_rsa id_dsa
      ```

1. KDE下deepin-wine-qq/tim/wechat的字体：
   1. 确保安装了所需的字体：Windows, wqy, ...
   1. `` sudo pacman -S deepin-wine-wechat deepin.com.qq.im/office gnome-settings-daemon ``
   1. 设置 `` /usr/lib/gsd-xsettings ``为开机启动
   1. 运行一次qq/tim/wechat，使wine自动配置
   1. `` env WINEPREFIX="$HOME/.deepinwine/Deepin-TIM" winecfg ``，改dpi=120
   1. 复制 `` zh.reg ``到各自的目录下，如 `` cp zh.reg ~/.deepinwine/Deepin-TIM/ ``
   1. `` env WINEPREFIX="$HOME/.deepinwine/Deepin-TIM" wine regedit ``，然后import这个zh.reg

1. Docker里的Archlinux报错：cannot sign locally：
   ```sh
   pacman-key --init
   pacman-key --populate archlinux
   pacman -Syy
   ```

1. Arduino相关：
   ```sh
   # Check arduino-cli related commands first!
   # Write your code first
   # Change some settings:
   # Change baudrate (exceute multiple times)
   stty -F /dev/ttyUSB0 speed 9600 cs8 -cstopb -parenb
   stty -F /dev/ttyUSB0 speed 9600 cs8 -cstopb -parenb
   # For non-root user
   # sudo usermod -a dialout $USER
   # sudo chmod 666 /dev/ttyUSB0
   arduino-cli core install arduino:avr
   arduino-cli compile --fqbn arduino:avr:uno xxx/xxx
   arduino-cli upload -p /dev/ttyUSB0 --fqbn arduino:avr:uno xxx/xxx
   # Listen on Serial
   cat < /dev/ttyUSB0
   minicom -D /dev/ttyUSB0 -b 9600
   ```

1. Armbian apt search非常慢：
   ```sh
   vim /etc/apt/apt.conf.d/02-armbian-compress-index # change to gz
   cd /var/lib/apt/lists
   rm *.lz4
   sudo apt update
   ```
   或者
   ```sh
   sudo apt-cache search
   ```
   
1. List user installed packages in Arch:
   ```sh
   comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)
   ```

1. acme.sh: mainly refer to trojan-tutor, but:
   - ~~Change the nginx sites enabled to domain.simple (same as the trojan-tutor config) and restart nginx.~~ No need to change. Directly use the current `domain.op1p` config file. (that means no need to do any change)
   - Stop the `tj` service. (modify `nginx` config if necessary, in case of domain name change)
   - Then follow the steps in the trojan-tutor: remove the domain directory in `` .acme `` ~~and try `` --staging `` at first~~.
      - `` sudo su -l -s /bin/bash acme ``
      - `` acme.sh --issue -d <domain> -w /var/www/acme-challenge ``
      - `` acme.sh --install-cert -d <domain> --key-file /etc/letsencrypt/live/<domain>.key --fullchain-file /etc/letsencrypt/live/<domain>.crt ``
      - `` acme.sh  --upgrade  --auto-upgrade ``
   - Then cp and mv the ``.crt `` and `` .key `` file to `` nginx `` and `` jupyter `` directory.

1. ffmpeg各种用法：
   - 裁剪尺寸、剪辑片段、压缩视频码率
   ```sh
   ffmpeg -i input.mp4 -vf "crop=width:height:x:y" -b 4000k -t 20 output.mp4
   ```
   - ffmpeg截取视频生成gif (需要 `` ImageMagick ``):
   ```sh
   ffmpeg -i video.mp4 -ss 9 -t 8 -vf "fps=10,scale=480:-1:flags=lanczos" -c:v pam -f image2pipe - | convert -delay 10 - -loop 0 -layers optimize output.gif
   ```
   - 截取/录制摄像头画面/视频
   ```sh
   sudo ffmpeg -f v4l2 -i /dev/video0 -video_size 640x480 -t 5 output.mp4
   sudo ffmpeg -f v4l2 -i /dev/video0 -vframes 1 output.jpg
   ```
   - 将图片转为视频
   ```sh
   ffmpeg -framerate 30 -i NAME_%d.jpg -c:v libx264 -r 30 NAME.mp4
   ```

1. Backup Orange Pi into img file:
   ```sh
   sudo dd if=/dev/mmcblk0p1 of=OPiArmbian.img status=progress # 16G takes 10 min
   sudo e2fsck -f OPiArmbian.img
   sudo resize2fs -M OPiArmbian.img
   ```

1. Linux create AP hotspot:
   See ArchWiki: <https://wiki.archlinux.org/title/Software_access_point#Tools>

1. Arch Linux touchpad tap disabled:
   ```sh
   xinput list-props "ETPS/2 Elantech Touchpad" # check the id
   xinput set-prop "ETPS/2 Elantech Touchpad" 343 1 # set the id to 1
   ```

1. Zotero renaming rules:
   ```
   {{ year suffix="." }}{{ title truncate="100" suffix="." }}{{publicationTitle suffix="-"}}{{authors max="1" name="family-given" join=" "}}
   ```

1. Zotero Better BibTeX setting:
   ```
   authorLastForeIni.upper + "_" + authorLast.upper + "_" + shorttitle(2,3) + "_" + year
   ```
