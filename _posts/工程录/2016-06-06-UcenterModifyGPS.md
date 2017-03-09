---
layout: post
title: 使用u-center修改GPS内置设定
category: 工程录
tags: 硬件
keywords: 
description: 
---

## 下载并安装
提供百度云盘[u-center](http://pan.baidu.com/s/1skFwlZ3)

也可官网下载。

## 操作步骤
* 连接GPS，打开u-center，连接串口

![]({{site.zhehua.images}}/Engineering/ucenter/f28404e68360099fa60758ae27bd707b.png)

* 修改频率

![]({{site.zhehua.images}}/Engineering/ucenter/8b9446b3e0836cf4ad9ba036b4514de7.png)


按步骤，修改间隔时间，然后send。

![]({{site.zhehua.images}}/Engineering/ucenter/0ac3370505312b59af81ce1fcc1ad966.png)

* 修改报文发送种类

![]({{site.zhehua.images}}/Engineering/ucenter/47e88c97ff0776d8029dc3fec7df4770.png)


右键选择是否对某项报文使能。

![]({{site.zhehua.images}}/Engineering/ucenter/bee808e9c1d8103d37242977c3390d46.png)


* 保存
注意选项，需要写入EEPROM，否则上电重启后设置不会生效。

![]({{site.zhehua.images}}/Engineering/ucenter/9269c43fef1db870ce378e6d5c4816c2.png)


