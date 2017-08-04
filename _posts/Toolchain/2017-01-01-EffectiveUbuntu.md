---
layout: post
title: 高效的Ubuntu工作环境
category: 工具链
tags: 
    效率工具链
keywords: 
description: 
---

## 绪论
本系列将

---
# 安装
建议：选择LTS版本
本人工作环境：14.04.4
已测试：16.04

# 系统准备(Necessary)
## 驱动
- 显卡
    Nvidiad(independent driver or Cuda)
    ```
    sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
    sudo apt-get update
    sudo apt-get install cuda
    ```

- 网卡(default is ok)

# 系统设置(Necessary)
- Choose best server

- System Update
```
sudo apt-get update
sudo apt-get upgrade
```

- Language Support
    - check update

# 系统设置(Custom)
- 根据屏幕调整图标大小
	- Appearance->Look->Launcher icon size

- Enable workspace
	- Appearance->Behavior->Enable workspace

- Modify Term(Necessary)
	- General：Cursor shape as I-Beam
	- Colors(set to solarized)
    	- Text:#eee8d5
    	- Background:#073642
    	- Built-in schemes:XTerm
    	- Scrolling：scrollback as Unlimited

- Change default appli
	- For a certain type file,eg,a ".avi" video,usr RightClick -> properties

- Move icon on sidebar
	- 点击需要调整的图标，等待一秒以上，即可拖动

- Move shortcut to desktop
		• /usr/share/applications
		• Move it to desktop

- Global Hotkey
	- Keyboard->Shortcuts->Custom Shortcuts-> "+"

- Run software when startup
	- search "Startup Applications"


# Main()
- nutstore
	• Donwload (Official Web)
        • Install
```
sudo dpkg -i nautilus_nutstore_amd64.deb
(if neccessary)sudo apt-get install -f
```

- zsh
see **zsh_note.md**
copy my backup file (Ctrl+H to see)
```
# update zsh
cp ~/codes/Shell/lib/zshrc ~/.zshrc

```

- System setting
```
# After zsh installed
. ~/codes/Shell/lib/ubuntu_env_setting.sh
# if copy operation cause permission issues
sudo chown -R zhehua:zhehua /home/zhehua

# Then you can use 

update_zsh

zshrc_setting
```

- MarkDown editor(haroopad)
		• Donwload (Official Web)
		• click to install

- Sougou中文输入法
    - 官网deb下载
    - 双击安装 or manually
        ```
        sudo dpkg -i sogoupinyin_2.0.0.0078_amd64.deb
        (if neccessary)sudo apt-get install -f
        sudo dpkg -i sogoupinyin_2.0.0.0078_amd64.deb
        ```
    - Language Support
		change input 由IBus改为fcitx
    - 注意顶栏是否有键盘图标(may need reboot),在此加入Sougou Pinyin并配置

- keepass
    - 说明：密码管理软件
    - 安装：
        ```
        sudo apt-get install keepass2
        ```
	- 使用：
		run icon
        中文（14.04 not good)
        ```
        sudo cp /media/zhehua/MySources/Software_Backup/Linuxware/1th/Chinese_Simplified.lngx /usr/lib/keepass2
        sudo chmod 777 /usr/lib/keepass2/Chinese_Simplified.lngx
        ```
- sublime
double run .deb
see **sublimeText3_note.md*
```
cp /home/zhehua/.config/sublime-text-3/Packages/User/Preferences.sublime-settings /home/zhehua/CrossSync/SoftwareConfig/IDEs/Preferences.sublime-settings
```

# Cross GFW
- Lantern
    - 说明：翻墙工具，安装即可使用，但不如XXnet好用
    - 安装：
		• Donwload (Official Web)
		• click to install
	- 使用：
		click to run

- XXnet
    - 说明：翻墙工具，安装即可使用，但不如XXnet好用
    - 安装：
		• Donwload (Official Web)
		• copy whole file to certain path
        ```
        chmod +x start
        ./start
        ```
	- 使用：
		• import CA
		• 127.0.0.1, 8087
		• Config appid

- 同步firefox
	- Sign in
	- 支付宝控件
        ```
        sudo ./aliedit.sh
        ```
    - hotkey
    	- 关闭标签： Ctrl+W
    	- 前一个标签页： Ctrl+Shift+Tab
    	- 下一个标签页： Ctrl+Tab 
# Coding Environment
- git
```
sudo apt-get install git
git --version
# if need gui
sudo apt-get install git-gui
git gui
```

- cmake
For certain version required by ROS
```
CMAKE1=v3.6
CMAKE2=cmake-3.6.0
wget http://www.cmake.org/files/$CMAKE1/$CMAKE2.tar.gz
tar xf $CMAKE2.tar.gz
cd $CMAKE2
# 2~3 min
./configure
# 1 min
make -j12
sudo make install
cmake --version
# if error raised(eg. ROS has installed cmake2.8)
# sudo rm /usr/bin/cmake
# sudo ln /usr/local/bin/cmake /usr/bin/cmake
which cmake
# use ccmake to config
sudo apt-get install cmake-curses-gui
ccmake ..
```

- clang
```
sudo apt-get install clang
```
see **clang_note.md**

- gcc/g++ update
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-4.9
```


- boost
```
./bootstrap.sh --prefix=/usr/local/
# sudo ./b2 link=static install
sudo ./b2 --buildtype=complete install
```

- opencv
see **OpenCV_Install_and_Uninstall.sh**

- doxygen
```
sudo apt-get install doxygen
sudo apt-get install doxygen-gui
sudo apt-get install graphviz
```

- Qt
chmod +x
double click to run
```
edenphoenix@163.com
keepass
```

- pycharm
* community version
```
INSTALL_NAME=pycharm
Pycharm_NAME=pycharm-community-2016.2.1.tar.gz
Pycharm_FOLDER=pycharm-community-2016.2.1
```

* professional version
```
INSTALL_NAME=pycharm
Pycharm_NAME=pycharm-professional-2016.2.1.tar.gz
Pycharm_FOLDER=pycharm-2016.2.1
sudo cp $Pycharm_NAME /opt/
cd /opt/
sudo tar -xzvf /opt/$Pycharm_NAME
sudo rm $Pycharm_NAME
cd $Pycharm_FOLDER
bash ./bin/$INSTALL_NAME.sh
sudo ln -s /opt/$Pycharm_FOLDER/bin/$INSTALL_NAME.sh /usr/bin/$INSTALL_NAME
```

- clion
```
INSTALL_NAME=clion
CLion_NAME=CLion-2016.2.1.tar.gz
CLion_FOLDER=clion-2016.2.1
sudo cp $CLion_NAME /opt/
cd /opt/
sudo tar -xzvf /opt/$CLion_NAME
sudo rm $CLion_NAME
cd $CLion_FOLDER
bash ./bin/$INSTALL_NAME.sh
sudo ln -s /opt/$CLion_FOLDER/bin/$INSTALL_NAME.sh /usr/bin/$INSTALL_NAME
```

	hack
    > http://172.245.22.235:1017
    [IntelliJ IDEA License Server本地搭建教程](http://blog.lanyus.com/archives/174.html)

* Inotify Watches Limit
```
sudo su
echo 'fs.inotify.max_user_watches = 5242880' >> /etc/sysctl.conf
exit
```

- IDEA
```
# unzip
# cp to /opt
# ./*.sh
# config
```

- phpstorm

** 卸载IDE，删除~/.pycharm* 或/root.pycharm* **

```
INSTALL_NAME=phpstorm
INSTALL_PACKAGE=PhpStorm-2017.2.tar.gz
INSTALL_FOLDER=PhpStorm-172.3317.83
sudo cp $INSTALL_PACKAGE /opt/
cd /opt/
sudo tar -xzvf /opt/$INSTALL_PACKAGE
sudo rm $INSTALL_PACKAGE
cd $INSTALL_FOLDER
bash ./bin/$INSTALL_NAME.sh
sudo ln -s /opt/$INSTALL_FOLDER/bin/$INSTALL_NAME.sh /usr/bin/$INSTALL_NAME
```

- datagrip
* professional version
```
INSTALL_NAME=datagrip
INSTALL_PACKAGE=datagrip-2017.1.5.tar.gz
INSTALL_FOLDER=DataGrip-2017.1.5
sudo cp $INSTALL_PACKAGE /opt/
cd /opt/
sudo tar -xzvf /opt/$INSTALL_PACKAGE
sudo rm $INSTALL_PACKAGE
cd $INSTALL_FOLDER
bash ./bin/$INSTALL_NAME.sh
sudo ln -s /opt/$INSTALL_FOLDER/bin/$INSTALL_NAME.sh /usr/bin/$INSTALL_NAME
```

- webstorm
* professional version
```
INSTALL_NAME=webstorm
INSTALL_PACKAGE=WebStorm-2017.2.tar.gz
INSTALL_FOLDER=WebStorm-172.3317.70
sudo cp $INSTALL_PACKAGE /opt/
cd /opt/
sudo tar -xzvf /opt/$INSTALL_PACKAGE
sudo rm $INSTALL_PACKAGE
cd $INSTALL_FOLDER
bash ./bin/$INSTALL_NAME.sh
sudo ln -s /opt/$INSTALL_FOLDER/bin/$INSTALL_NAME.sh /usr/bin/$INSTALL_NAME
```

- Java JDK
```
# Change **JAVA_HOME**
sudo su
echo "#set Java environment" >> /etc/profile
echo "export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_101" >> /etc/profile 
echo "export JRE_HOME=${JAVA_HOME}/jre" >> /etc/profile 
echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> /etc/profile 
echo "export PATH=${JAVA_HOME}/bin:$PATH" >> /etc/profile
exit

java -version
sudo update-alternatives --install /usr/bin/java java /opt/java/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /opt/java/bin/javac 300
sudo update-alternatives --config java
# choose **1**
java -version
# Like below
# java version "1.8.0_101"
# Java(TM) SE Runtime Environment (build 1.8.0_101-b13)
# Java HotSpot(TM) 64-Bit Server VM (build 25.101-b13, mixed mode)

```

- MATLAB
```
# Extract ISO
cd MATHWORKS_R2014A
sudo ./install
# Install path: /opt/ or /usr/local/
# see */Matlab/Crack/Readme.txt
sudo cp ./libmwservices.so /opt/MATLAB/R2014a/bin/glnxa64
matlab

# if MatLab error: cannot open with static TLS 
# Add more memory: Preferences > General > Java-Heap Memory
```

- Deep Learning

- ROS

- ORB

- scikit learn
```
sudo pip install -U scikit-learn
```


# 系统增强
## all in line
```
sudo apt-get install hardinfo gparted k4dirstat hardinfo htop tree bleachbit classicmenu-indicator nemo catfish
```

- Synapse
	- 说明：quick start tool
    - 安装：
        ```
        sudo add-apt-repository ppa:synapse-core/ppa
        sudo apt-get update
        sudo apt-get install synapse
        ```
	- 使用：
        Preference ->
            Startup on login
            Activate shortcut：Ctrl + \

- Synaptic:
	- 说明：增强包管理器
    - 安装：
		• Software Center
	- 使用：
        ```
        sudo synaptic
        ```

- ClassicMenu Indicator
  	- 说明：add classic Menu at top
    - 安装：
        • Software center
	- 使用：
        autorun at startup

- Screen Control
		Flux
		Redshift

## File Management:
- Files(nemo)
 	- 说明：增强文件管理器
    - 安装：
		• Software Center
	- 使用：
		Icon Run

- catfish
    - 说明：增强搜索功能
    - 安装：
		• Software Center
		• 14.04 add "Optional add-ons"
	- 使用：
		input and search

## Disk manage
- gnome-disks
    - 说明：查看硬盘信息
	- 使用：
		```
        gnome-disks
        ```

- gparted
    - 说明：硬盘可视化，分区等操作
    - 安装：
        ```
		sudo apt-get install gparted
        ```
	- 使用：
		```
        sudo gparted
        ```

- K4dirstat
    - 说明：Visualize storage space
    - 安装：
        ```
        sudo apt-get install k4dirstat
        ```
	- 使用：
		```
        k4dirstat
        ```

## System manage
- gnome-system-monitor
    - 说明：可视化系统监视器
    - 安装：
        ```
        # 14.04 embedded
        sudo apt-get install gnome-system-monitor
        ```
	- 使用：
		```
        gnome-system-monitor
        ```

- hardinfo
    - 说明：系统硬件信息，另有轻量化的sysinfo可供选择
    - 安装：
        ```
        sudo apt-get install hardinfo
        ```
	- 使用：
		```
        hardinfo
	`	```

- Htop
    - 说明：增强原top命令。统计数据相比gnome-system-monitor更加精确（比如监视虚拟机进程所占用系统资源）。
    - 安装：
        ```
        sudo apt-get install htop
        ```
	- 使用：
		```
        htop
        # example: show thread
        # F2 -> Display otions -> Tree view & Show custon thread names(up&down to choose,enter to set)
        ```

- tree
    - 说明：将文件夹使用树形显示
    - 安装：
        ```
        sudo apt-get install tree
        ```
	- 使用：
		```
        tree filepath
        ```

- BleachBit
    - 说明：trash clean tool
    - 安装：
        ```
        sudo apt-get install bleachbit
        ```
	- 使用：
		```
        bleachbit
        ```

- BleachBit
    - 说明：trash clean tool
    - 安装：
        ```
        wget http://www.scootersoftware.com/bcompare-4.1.9.21719_amd64.deb
        sudo apt-get update
        sudo apt-get install gdebi-core
        sudo gdebi bcompare-4.1.9.21719_amd64.deb
        # Uninstall
        # sudo apt-get remove bcompare
        ```
    - 使用：
        ```
        bcompare
        ```



## all in line
```
sudo apt-get install smplayer vlc shutter kazam audacious font-manager goldendict speedcrunch
```
- QQ
    - 安装：
        ```
        sudo dpkg -i fonts-wqy-microhei_0.2.0-beta-2_all.deb
        sudo dpkg -i ttf-wqy-microhei_0.2.0-beta-2_all.deb

        sudo apt-get install wine
        sudo apt-get -f install

        sudo dpkg -i wine-qqintl_0.1.3-2_i386.deb
        ```

- FoxitReader
    - 说明：有注释功能（evince has not)，基于gnome(okular基于KDE),独立软件不依赖浏览器
    - 安装：
		• Download:
		https://www.foxitsoftware.com/products/pdf-reader/
		Auto scan your os platform,so you should download it when you need it
        • chmod +x FoxitReader.enu.setup.1.1.0.0225\(r205262\).x64.run 
		• Run it, set `/opt/foxitsoftware/foxitreader` as path
		• Run /opt/foxit->tab/foxit->tab.shs
	- 使用：
		改为pdf格式默认打开软件

- [Video Player]
 	- 说明：Video Player
    - 安装：
        - SMPlayer
            • Software center
        - VLC
            • Software center
	- 使用：
		set SMPlayer as default(It can remember quit point without setting)

- Gnash SWF Viewer
 	- 说明：play .swf file
    - 安装：
		• Software center
	- 使用：
		Right click to open with

- [Photo Viewer]
 	- 说明：Photo Viewer
    - 安装：
         Shotwell(14.04 embeded)
            • Software center
	- 使用：
		Run Icon

- [Picture Edit]
 	- 说明：Like Photoshop
    - 安装：
        - GIMP
            • Software center
        - ImageMagick
            • open source code
	- 使用：
		set SMPlayer as default(It can remember quit point without setting)

- [Screen Shot]
 	- 说明：Like Photoshop
    - 安装：
        - Shutter
            • Software center
        - Screenshot
            14.04 embeded[shift+print]
	- 使用：
		Run Icon or Hotkey

- [Screen Capture]
 	- 说明：Screen Capture
    - 安装：
        - Kazam
        	• Software center
        - vokoscreen
			• Software center
	- 使用：
		set Kazam as default

- [Music Player]
 	- 说明：Music Player & lyric plugin
    - 安装：
        - Audacious
            • Software center
        - osdlyrics
        	* From .deb
                Download .deb->install
        	* From source(not good)
                ```
                git clone https://github.com/osdlyrics/osdlyrics
                ```
	- 使用：
		Run Audacious
		```
        osdlyrics
        ```
		set in icon: Scrolling mode

- HandBreake
    - 说明： 跨平台免费视频压缩软件，界面美观，效果极好
    - 安装：
            ```
            sudo add-apt-repository ppa:stebbins/handbrake-releases
            sudo apt-get update
            sudo apt-get install handbrake-gtk
            sudo apt-get install handbrake-cli
            ```
    - 使用：
        搜索栏“handbrake”

- Font Manager
 	- 说明：view, install & manage fonts
    - 安装：
		• Software center
        or
        ```
        sudo apt-get  install font-manager
        ```
	- 使用：
		* click the gear icon(Manage fonts)
		* Install Fonts
		* choose path(download/collect your fonts)
		* open word-like software to varify installations succeed

- Getting Things Gnome
  	- 说明：GTD (go to do) software
    - 安装：
		• Software center
	- 使用：
		Run Icon

- TeraCrypt
  	- 说明：文件加密管理
    - 安装：
        ```
        ./veracrypt-1.17-setup/veracrypt-1.17-setup-gui-x64
        ```
	- 使用：
		Run Icon

- SpeedCrunch
  	- 说明：caculator
    - 安装：
		• Software center
	- 使用：
		Run Icon

- Vmware
  	- 说明：GTD (go to do) software
    - 安装：
		• Download (Official Web)
        • Installation
        ``
        VMNAME=VMware-Workstation-Full-12.1.1-3770994.x86_64.bundle
        chmod +x $VMNAME
        sudo ./$VMNAME
        ```
		• VMware Workstation v12 for Windows /Linux
			> 5A02H-AU243-TZJ49-GTC7K-3C61N
	- 使用：
			Run Icon

- Goldendict
  	- 说明：dictionary
    - 安装：
		• Software center
	- 使用：
		Run Icon
        add dictionarys

- Thunderbird
  	- 说明：best email app at ubuntu
    - 安装：
		14.04 embedded
	- 使用：
        open thunderbird at least once (generate below profiles.ini)
        ```
        cp ~/CrossSync/SoftwareConfig/thunderbird_profiles.ini /home/zhehua/.thunderbird/profiles.ini
        ```
		see **thunderbird.md**

- WPS
  	- 说明：office like tools
    - 安装：
		official download wps for linux
        ```
        sudo dpkg -i wps-offic_e10.1.0.5672\~a21_amd64.deb
		```
	- 使用：
		Run Icon

- teamviewer
    - 说明：remote desktop control
    - 安装：
        official download
        ```
        sudo dpkg -i teamviewer_11.0.57095_i386.deb
        ```
    - 使用：
        Run Icon
        Sign up & Sign in
        Set account to enable mutual remote control and test it

- XnConvert
  	- 说明： Image convert
    - 安装：
		official download: http://www.xnview.com/en/xnconvert/#downloads
        ```
        sudo dpkg -i XnConvert-linux-x64.deb
        ```
	- 使用：
		Run Icon

- mendeley
    - 说明： Image convert
    - 安装：
        ```
        sudo dpkg -i mendeleydesktop_1.14-stable_amd64.deb
        ```
    - 使用：
        Run Icon

- WizNote
    - 安装：
        ```
		sudo add-apt-repository ppa:wiznote-team
		sudo apt-get update
		sudo apt-get install wiznote
        ```

# TODO
Chrome
texstudio
mathematica
xmind
ftp：filezilla


## 系统备份
- Setting -> Backups
    - 说明：系统自带，便于自动定时备份，但备份文件不能直接打开查看
	- 使用：
		设置需保存的文件，备份将放置的路径，及其他备份定时规则

- FreeFileSync
    - 说明：翻墙工具，安装即可使用，但不如XXnet好用
    - 安装：
		```
		sudo add-apt-repository ppa:freefilesync/ffs
		sudo apt-get update
		sudo apt-get install freefilesync
        ```
	- 使用：
        ```
        sudo FreeFileSync
        ```

# TroubleShooter
* Software Centor is crash
sudo apt-get install --reinstall unity-control-center
sudo apt-get install ubuntu-desktop

* change os startup order
```
sudo gedit /etc/default/grub
# GRUB_DEFAULT=0,change as your order
# GRUB_TIMEOUT=5,change if you like
sudo update-grub
```

* System hibernate
```
sudo gedit /var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla

# beloew *no* to *yes*
[Disable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Disable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate
ResultActive=yes

sudo pm-hibernate
```

* USB wireless network adapter
https://help.ubuntu.com/community/WifiDocs/WirelessCardsSupported
http://www.htpcbeginner.com/linux-compatible-usb-wireless-adapters-2012/

* Change Owner and Group
```
sudo chown -R zhehua:zhehua *
```

# My tips

- stack size
```
# get it
ulimit -s
# set it
ulimit -s 81920
```

- check Ubuntu version
```
cat /etc/issue
```




