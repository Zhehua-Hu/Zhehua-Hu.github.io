---
layout: post
title: "给你的算法搭建Web API(二): Python+Flask实现"
category: 工程录
tags: 
    工程录
keywords: 
description: 
---

## 绪论
本文实现

笔者的工作环境基于Pycharm，如有兴趣了解，参见[]
为了照顾不同环境的读者，以下讲解基于终端，也就是说你应该如下运行程序：

```
python path/to/tutorial.py
```

建议你下载代码示例

```
git clone https://github.com/Zhehua-Hu/MakeAPI-Tutorials.git MakeAPI-Ref
```

然后创建一个新的文件夹，按照本文一步步进行，有疑问再参考代码示例

```
mkdir MakeAPI-Tutorials && cd  MakeAPI-Tutorials
```


## 配置virtualenv环境
* 为什么要使用虚拟python环境工具　virtualenv？

原因在于，当你需要同时维护多个使用了python的项目时，
virtualenv使得这些项目可以在同一时间基于不同版本的python与库运行。


* 安装

```
sudo apt-get install virtualenv
virtualenv --version
```

* 创建

```
virtualenv newpy --python=python2.7
# virtualenv有些可选参数，上条命令选择使用的python版本
# 具体查询
virtualenv --help
```

* 工作方式
```
# 激活虚拟环境
source ./newpy/bin/activate

# 这之后就进入了虚拟环境
# <working time>

# 退出虚拟环境
deactive
```

---
注意：下文均在虚拟环境下newpy进行
## flask入门：helloworld


### 安装flask
```
pip install flask
```

### helloworld示例

```
mkdir demo1_helloworld && cd demo1_helloworld
touch helloworld.py
```

helloworld.py 如下

```
#!newpy/bin/python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, World!"

if __name__ == '__main__':
    app.run(debug=True)
```

运行
```
python helloworld.py
```

通过浏览器打开
```
firefox http://127.0.0.1:5000/
```

### 释疑

* return返回网页，故可以return string或html格式

```
return "Hello, World!"
return "<h1 style='color:black    '>Hello, World!</h1>"
```

* app.run()的参数

```
# 无参数
app.run()

# 调试模式
app.run(debug=True)

# 
# app.run(debug=True, port=8080)

# 默认host为本机地址localhost, 一般被设置为本机回环地址127.0.0.1

# app.run(debug=True, host='192.168.1.131', port=8080)
app.run(debug=True, host='0.0.0.0', port=8080)
```



##　工作序列

venv/bin/pip install flask-httpauth


curl -i http://192.168.1.131:8080/todo/api/v1.0/tasks
curl -u ok:python -i http://192.168.1.131:8080/todo/api/v1.0/tasks
curl -u ok:python -i http://121.69.57.2:8080/todo/api/v1.0/tasks


curl -u ok:python -i http://192.168.1.131:8080/todo/api/v1.0/tasks/1


curl -u ok:python -i -H "Content-Type: application/json" \
-X POST -d '{"add1":3.1415, "add2":3.1}' \
http://tagea.ngrok.cc/api


##

```
mkdir demo2_query_json && cd demo2_query_json
```





##

```
mkdir demo3_update_delete && cd demo3_update_delete
```

##

```
mkdir demo4_access_externally && cd demo4_access_externally
```

> 
`-u: authorize`
-d: --data
-X: set protocol
-i: --include
-H: --header



## 参考

Miguel Grinberg的博客
    * [Designing a RESTful API with Python and Flask](https://blog.miguelgrinberg.com/post/designing-a-restful-api-with-python-and-flask)

上文中译
    * [使用 Python 和 Flask 设计 RESTful API](http://www.pythondoc.com/flask-restful/first.html)

flask
[写给新手看的Flask+uwsgi+Nginx+Ubuntu部署教程](http://www.cnblogs.com/knarfeh/p/5616515.html)


