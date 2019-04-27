## 日常笔记

1. 包管理器报错：
   - yum: 
      ```shell
      sudo rm -rf /var/run/yum.pid
      ```
   - apt: 
      ```shell
      sudo rm /var/cache/apt/archives/lock
      sudo rm /var/lib/dpkg/lock
      ```

1. touchpad:
   ```shell
   synclient TapButton1=1
   ```

1. g++:
   ```shell
   g++ filename.cpp -o filename
   ```

1. Install VMD:
   ```shell
   tar xvf vmd_xxx.tar.gz
   ./configure LINUX(or LINUXAMD64)
   ./confgiure
   cd src
   sudo make install
   ```

1. 输入法图标消失怎么办？
   ```shell
   kill all ibus-daemon #（结束进程）
   ibus-daemon -d #（重启ibus）
   ```

1. 卸载已安装的rpm包:
   ```shell
   sudo rpm -e --nodeps xxx
   ```

1. ubuntu亮度:
   ```shell
   sudo vim /etc/default/grub
   GRUB_CMDLINE_LINUX="acpi_osi=Linux acpi_backlight=vendor"
   sudo update-grub(dangerous!)
   sudo reboot
   ```

1. 命令行上网
   ```shell
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
      ```shell
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
   ```shell
   gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true
   ```
   - 现在用gnome-twaek-tools即可。

1. 命令行广播：
   1. record and replay:
      ```shell
      #record: 
      script -t 2> timing.log output.session
      #type you cmds, use 'exit' to terminate
      
      #replay: 
      scriptreplay timing.log output.session
      ```
   
   1. real-time broadcasting:
      ```shell
      #in terminal 1(broadcaster)
      mkfifo scriptfifo
      #in terminal 2(audience)
      cat scriptfifo
      #in terminal 1(broadcaster)
      script -f scriptfifo 
      #type your cmds, use 'exit' to terminate
      ```

1. 生成大文件
   ```shell
   dd if=/dev/zero of=junk.data bs=1M count=1
   ```

1. kill进程：
   ```shell
   sudo kill -s 9 pid
   ```

1. crossover crack:
   - 下载：[https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_16.2.0-1.deb](https://media.codeweavers.com/pub/crossover/cxlinux/demo/crossover_16.2.0-1.deb)
   - 安装
   - 把这个winewrapper.exe.so替换``/opt/cxoffice/lib/wine/``的那个so

1. 搭建ftp服务器的防火墙设置(if necessary)：
   ```shell
   iptables -I INPUT -p tcp --dport 20 -j ACCEPT
   iptables -I INPUT -p tcp --dport 21 -j ACCEPT
   ```

1. centos关闭图形界面：
   ```shell
   sudo vim /etc/inittab #line 12-14, modify as below:
   #ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target (这是默认开机图形界面)
   #ln -sf /lib/systemd/system/multiuser.target /etc/systemd/system/default.target (这是默认开机命令行界面)
   ```

1. save power:
   ```shell
   sudo apt install tlp cpufrequtils
   ```

1. gedit run python plugin:
   ```shell
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
   ```shell
   #install mkisofs
   # -m means exclude some file
   # -J is related with Windows. See the manual.
   mkisofs -J (-m SomeDirectory/Useless.txt) -o OutputFile.iso SomeDirectory/
   ```

1. WSL path:
   ``C:\Users\username\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs``

1. ffmpeg:
   ```shell
   ffmpeg -i input.mp4 -vf "crop=width:height:x:y" -b 4000k -t 20 output.mp4
   ```

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
      ```shell
      sudo chmod 644 winfonts
      sudo mkfontdir
      sudo mkfontscale
      sudo fc-cache -fv
      ```
      刷新字体缓存。这一步的目的是使texlive支持中文。下一步才来解决格式化文件的问题。点一下格式化文件，查看LaTeX Workshop的输出，应该是缺少一些perl的工具，执行：
      ```shell
      sudo perl -MCPAN -e shell
      ```
      进入perl的shell，然后按缺失的包的名字安装。
      ```perl
      install Log::Log4perl
      install Log::Dispatch::File
      install YAML::Tiny
      install File::HomeDir
      ```
      这样这个bug就修好了。

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
   ```shell
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
   ```shell
   sudo vim /etc/docker/daemon.json
   ```
   写入：
   ```json
   {
       "registry-mirrors": ["https://registry.docker-cn.com"]
   }
   ```

1. 安装hexo报错：
   ```shell
   sudo npm install --unsafe-perm --verbose -y hexo-cli
   ```

1. 手动redshift：
   ```shell
   redshift -l 32.05:118.766 -t 5500:3500
   ```