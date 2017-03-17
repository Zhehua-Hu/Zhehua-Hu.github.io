---
layout: post
title: Linux命令行学习之路
category: 工具链
tags: 
    效率工具链
    学习之路
keywords: 
description: 
---

## 绪论

## 入门资源
[UNIX Tutorial for Beginners](http://www.ee.surrey.ac.uk/Teaching/Unix/)


---
## Essential
Ctrl + C	:	kill　program
Ctrl + U	:	delete whole line

Ctrl + D	:	quit program；end of file
Ctrl + Z	:	suspend
Ctrl + R	:	search history

## Basics
### You must know
whatis command	:	show command usage in one line
man/Info/help
ls
> better use ll or ls -l

cd
>
cd subdir
cd /
cd ~
cd ../


mv
rm
cp
pwd
mkdir
touch	:	Update time/if not exist then create
echo	:	use $ show variable value
cat
sudo
apt-get
>
install
update
upgrade
remove
autoremove


### Permission management
ls -l
>drwxrwxr-x
file/directory owner group everyone

chmod
>	4:read
	2:write
	1:excute
```
sudo chmod a+x <filename>
sudo chmod 775 <filename>
```

## Advanced Basics
### Bash hotkey
Ctrl+Shift+C	:	copy
Ctrl+Shift+V	:	paste
Ctrl+U	:	clear current command
Ctrl+l	:	clear srceen
Ctrl+a	:	to head
Ctrl+e	:	to end

### Alias
```
alias cd1='cd ../'
alias cd2='cd ../../'
alias cd3='cd ../../../'
alias cd4='cd ../../../../'
alias cd5='cd ../../../../../'
```
### Links
hard link **VS** soft link(symbol)
```
mkdir test
cd test
touch f1
cat f1
echo "f1 write!" > f1
ln f1 f2
ln -s f1 f3
cat f1
cat f2
cat f3
echo "f2 write" >> f2
cat f1
cat f2
cat f3
echo "f3 write" >> f2
cat f1
cat f2
cat f3
rm f1
cat f1
cat f2
cat f3
```

### Progress Management
name &	:	run it background
> demo : xlogo &
ps	:	display the active processes
jobs	:	display the background/suspend process
fg %num		:	num use PID 
bg %num	:	num use PID

```
ps
jobs
xlogo &
ps
jobs
fg % 1
Ctrl+Z
ps
job
bg % 1
ps
job
fg % 1
Ctrl+C
```

kill	:	terminate process

top	:	show process info(accurate!)
### Search
whereis filename
which filename

find
locate
### Tools
uname -a	:	show system info
lsblk	：	Gparted can replace it
sha1sum/md5sum
gzip
gunzip
tar cvf output inputs
tar xvf zipped_file

### User management
su
sudo useradd
sudo userdel
sudo passwd
sudo groupadd
Users manage



## Script Basic
./s1.sh
sh s1.sh	: create sub shell
source s1.sh: run in current shell

### Variables
* printinv	:	print out whole env val
* bash environment variable

USER	已登录用户的名称
UID	用数字表示的已登录用户的用户 id
HOME	用户的主目录
PWD	当前的工作目录
SHELL	shell 的名称
$	进程 id（或运行的 bash shell 或其他进程的 PID
PPID	启动当前进程的进程的 id（即父进程的 id）
?	上一个命令的退出代码
[cite link](http://www.ibm.com/developerworks/cn/linux/l-lpic1-v3-103-1/)

* shell variable assignment
```
a=1
b(no blank here)=2
```


* redirection
\>	:	overide
\>>	:	append



---
下载

curl是libcurl这个库支持的，wget是一个shell命令。
http://blog.csdn.net/jiang314/article/details/53172506
http://bolg.malu.me/html/2011/1239.html


----
## 日常使用笔记

### Show formated date
```
echo CurrentDate：`date +"%Y-%m-%d"`
echo "`date`"
```


### Debian auto startup

```
crontab -e
# Command <f1 f2 f3 f4 f5 program>
```

其中 f1 是表示分钟，f2 表示小时，f3 表示一个月份中的第几日，f4 表示月份，f5 表示一个星期中的第几天。program 表示要执行程式的路径。

http://www.cnblogs.com/lsmsky/archive/2012/03/08/2385405.html


### find file contain certain string
```
find . -name "*" | xargs grep "ma"
```
> In path .
> find "*" named file
> search string "ma"


### find contained file count
```
ls -lR|grep "^-"|wc -l
```







