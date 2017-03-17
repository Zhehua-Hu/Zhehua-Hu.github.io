---
layout: post
title: gitignore简明语法
category: 工具链
tags: 
    git/github
keywords: 
description: 
---

## 绪论
git应管理重要的，由人力投入产生的代码、文件，对程序能自动生成的文件就可以使用gitignore“屏蔽”。


## 简明语法

```
# _______________________________________________
# 		Whole Folder
# _______________________________________________
# 注释使用#
# 整个文件屏蔽写法有
# tmp
# tmp/
# /tmp/

# 推荐用，原因见下
/tmp/

# _______________________________________________
# 		Mixed
# _______________________________________________
# 忽视该文件夹下所有文件,两种写法
/tmp/
/tmp/*
#　建议采用
/tmp/*
#　因为全文件夹屏蔽，应放置在Whole Folder一栏；

# 子文件夹除外，加！即可
# 注意除外文件夹或其内文件时需以 "/" 开头
!/tmp/docPictures/
!/tmp/doc/demo.txt

# _______________________________________________
# 		Whole Type
# _______________________________________________
# 忽视所有类型
# 通配符
# 1 char： "?"
# n(>=1) chars： "*"

*.pyz
*.pyc
# 除外某个文件写法
!test.pyc

# _______________________________________________
# 		Single File
# _______________________________________________
# 忽视某文件
resources.py
```

你可以直接输入命令下载本模板
```
#
wget https://github.com/Zhehua-Hu/Aries/blob/master/templates/.gitignore 
#
```




---
## 注意事项

### 可以使用正则表达式产生match list

```
[<regex>]
```

### 如何上次空目录
git不能上次完全空的目录，但有时该文件夹可以传递某些信息，或使得架构更完整。
总之必要时，可以在该文件夹内创建空文件

```
touch .makesureEmptyFolderExist
```

---
## 其他资源

* [Demo gitignore](https://github.com/github/gitignore)

含有多种工程的gitignore模板,可用作参考
