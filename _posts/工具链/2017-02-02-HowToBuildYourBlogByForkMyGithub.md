---
layout: post
title: 使用本模板搭建博客
category: 工具链
tags: 
    Git
    Blog
keywords: 
description: 
---

## 流程概论

* 预备工作：
    - １小时以上的空闲时间
    - 记录自己的安装流程
    - 有关文件请集中管理


* 实现框架简介

    本博客基于jekyll+[Github Page](https://pages.github.com/)实现，感谢[林安亚](http://painterlin.com/)的原始框架,

    本人做了较大程度的修改, 请直接按以下步骤进行。

    同类博客鉴赏:
    - [林安亚](http://painterlin.com/)
    - [闫肃](http://yansu.org)
    - [lanbing](http://lanbing510.info)

* Github账号注册，Github账号名后面会使用。

* 进入[我的项目](https://github.com/Zhehua-Hu/Zhehua-Hu.github.io)，选择右上角Fork,
进入Fork后你自己项目的setting,修改Repository name为username.github.io(username是你的Github账号名）

* 使用[Clone or Download](https://github.com/Zhehua-Hu/Zhehua-Hu.github.io)下载源码包
    其中会包含我的博客内容，建议等熟悉发布流程与修改方式后自行删去

* **[可选做]** 购买你的域名

    如我的域名"zhehua.info", 域名提供商与DNS解析互相绑定。对我而言，使用的GoDaddy与DNSPod

    - 修改源码包CNAME文件: yourDomain.Name

    - Godaddy:
        add nameserver:
        f1g1ns1.dnspod.net
        f1g1ns2.dnspod.net

    - DNSpod:
    add [1]:@ CNAME username.github.io
    add [2]:www CNAME username.github.io

    - Github setting中Custom domain写入yourDomain.Name

    - 等待生效，通常几分钟至几小时内即生效。


* 安装jekyll

    - Ubuntu

    ```
    sudo apt-get install ruby-dev
    ruby -v
    gem -v

    # 安装权限问题加sudo
    gem install jekyll
    gem install bundle

    # cd to folder username.github.io
    jekyll server
    ```

    - Windows
    [参考](http://kresnik.wang/works/tech/2015/06/07/%E5%9C%A8github-pages%E7%BD%91%E7%AB%99%E4%B8%8B%E7%94%A8jekyll%E5%88%B6%E4%BD%9C%E5%8D%9A%E5%AE%A2%E6%95%99%E7%A8%8B.html)





## Jelly使用

* 入门参考
[发布文章、加入评论功能、加入Google Analytics](http://www.jianshu.com/p/ffbbed22f984)

[清晰的中文wiki](http://wiki.jikexueyuan.com/project/jekyll/)



## 定制与插件


### 加入Emoji图像支持

[参照安装](https://github.com/jekyll/jemoji)

* install

```
gem install jemoji
```


* And add the following to your site's _config.yml

```
gems:
  - jemoji
````


[官网](http://jekyll.com.cn/docs/plugins/)
[常见插件](http://wiki.jikexueyuan.com/project/jekyll/plugins.html)
