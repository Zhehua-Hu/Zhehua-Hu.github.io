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

[Demo gitignore](https://github.com/github/gitignore)


## 通用模板
```
# _______________________________________________
# 		Whole Folder
# _______________________________________________

# 注释使用#
# 整个文件屏蔽写法有
# tmp
# tmp/
# /tmp/

# 推荐用
/tmp/

# _______________________________________________
# 		Mixed
# _______________________________________________
# 忽视该文件夹
/tmp/doxygen/

# 但其子文件夹除外，加！即可，这是用
!/tmp/docPictures/

# _______________________________________________
# 		Whole Type
# _______________________________________________
*.pyz
*.pyc

# _______________________________________________
# 		Single File
# _______________________________________________
resources.py
```


## 注意事项
exclusive usage:
* for folder
> start with "/"

* 1 char
"?"

* n(>=1) chars
"*"

* match list
[<regex>]

inclusive usage:
start with "!"

**Git cannot add a completely empty directory, you can add .gitkeep file in the empty file you want to push**
