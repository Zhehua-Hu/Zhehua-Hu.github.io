---
layout: post
title: 基于Ubuntu的GPS开发事项
category: 工程录
tags: 硬件
keywords: 
description: 
---



## 串口GUI工具: cutecom

```
sudo apt-get install cutecom
sudo cutecom
```

## Check if GPS is connected

* 对于ＵＳＢ转串口

```
ll /dev/ttyUSB*
```

*  对于串口

```
ll /dev/tty*
```

## 使用Qt + C++解析
使用Qt库的优势在于可以基于其信号槽机制，并异步读取串口流。

```
# Read info
sudo ~/Qt/Examples/Qt-5.7/serialport/build-cenumerator-Desktop_Qt_5_7_0_GCC_64bit-Debug/cenumerator 

# Asyn receive
sudo ~/Qt/Examples/Qt-5.7/serialport/build-creaderasync-Desktop_Qt_5_7_0_GCC_64bit-Debug/creaderasync ttyUSB0 9600

# terminal
sudo ~/Qt/Examples/Qt-5.7/serialport/build-terminal-Desktop_Qt_5_7_0_GCC_64bit-Debug/terminal 
```

## 常用协议

[参考](http://www.cnblogs.com/csMapx/archive/2011/11/02/2232663.html)

