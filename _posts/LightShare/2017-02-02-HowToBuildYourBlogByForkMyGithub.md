---
layout: post
title: "博客之事(二)：使用本模板搭建博客"
category: 轻分享
tags:
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

* 入门

[发布文章、加入评论功能、加入Google Analytics](http://www.jianshu.com/p/ffbbed22f984)

[清晰的中文wiki](http://wiki.jikexueyuan.com/project/jekyll/)

* 参考

[官网](https://jekyllrb.com/docs/posts/)

## 定制与插件

[官网](http://jekyll.com.cn/docs/plugins/)

[常见插件](http://wiki.jikexueyuan.com/project/jekyll/plugins.html)


## 选择共享协议
[知识共享许可协议](https://creativecommons.org/choose/?lang=zh)

[介绍wiki](https://zh.wikipedia.org/wiki/%E5%88%9B%E4%BD%9C%E5%85%B1%E7%94%A8)



## 博客主题颜色修改

/*1ABC9C blue #268bd2 */
/*16A085 to green #859900 */
/*base #073642 */
/*#E5F7F3 #31708F*/


## 代码高亮

常用有Pygments，[google-code-prettify](https://github.com/google/code-prettify)。

由于Pygments需要在markdown文件内插入{`%` highlight } <YourCode> {`%` endhighlight `%`} 标识符， 使得markdown语法格式不再纯粹，也不再通用。

而google-code-prettify配置好后可以用 <pre> <YourCode>  </pre>标识符， 也可以使用传统的```或tab显示代码块。


## SEO

百度收录
http://guochenglai.com/2016/09/26/baidu-crow-github-page/

谷歌检索
http://www.jianshu.com/p/df46bca5889d

[世界IT产品市场份额统计](http://gs.statcounter.com)

[中国搜索引擎市场份额统计](http://gs.statcounter.com/search-engine-market-share/all/china)

## 添加sitemap
[google 添加sitemap](https://www.google.com/webmasters)

添加的文件见"sitemap.txt"

## 使用超链接引用自身博文
[博文]({{site.zhehua.home}}/2016/07/05/GitignoreSyntax.html)

```
[博文]({{site.zhehua.home}}/2016/07/05/GitignoreSyntax.html)
```

## 参考
[官网中文教程](http://jekyll.com.cn/docs/home/)

[JavaScript 参考手册](http://www.w3school.com.cn/jsref/index.asp)


## 未解之谜
### 目录顺序排序代码

```
{ % for category in site.categories %}
<li><a href="#{{ category | first }}" data-toggle="tab">{{ category[0] }}</a></li>
{ % endfor %}
```

其效果为

```
{% for category in site.categories %}
<li><a href="#{{ category | first }}" data-toggle="tab">{{ category[0] }}</a></li>
{% endfor %}
```

### 逆序

```
{ % for category in site.categories reversed%}
<li><a href="#{{ category | first }}" data-toggle="tab">{{ category[0] }}</a></li>
{ % endfor %}
```

其效果为

```
{% for category in site.categories reversed%}
<li><a href="#{{ category | first }}" data-toggle="tab">{{ category[0] }}</a></li>
{% endfor %}
```


### 语法解析

```
｛｛ list|first ｝｝: 返回列表第一个元素

｛｛ category[0] ｝｝ : 返回category第一个元素

<a href=link>  </a> : 绝对跳转链接

data-toggle="tab" : 以tab事件触发，终止了链接默认行为

<li>  </li> ： 无序列表
```

但目前无法实现按任意顺序列出category目录

以下英文的category也无法奏效
```
{ % for category in site.categories[cat] %}

{ % for category in site.categories.cat %}
```