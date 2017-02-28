---
layout: post
title: 手把手照模板搭建你自己的博客
category: 工具链
tags: 
    Git
    Blog
keywords: 
description: 
---



# install

https://pages.github.com/
http://painterlin.com/
http://lanbing510.info/


# steps



sudo apt-get install ruby2.3-dev
ruby -v
gem -v

sudo apt-get install nodejs
sudo apt-get install ruby-dev
sudo gem install jekyll
sudo gem install bundle


* remove optimization


# Folder
public: no need to change
_includes:
_layouts:

-config.yml: 

pages:
about.html
Atom供稿格式（Atom Syndication Format）

https://help.github.com/articles/using-a-custom-domain-with-github-pages/

CNAME: yourDomain.Name
DNSpod:
add [1]:@ CNAME username.github.io
add [2]:www CNAME username.github.io

godaddy:
add nameserver:
f1g1ns1.dnspod.net
f1g1ns2.dnspod.net

Modify github setting

wait!