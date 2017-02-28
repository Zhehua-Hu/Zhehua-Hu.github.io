---
layout: post
title: 编译器Gcc/Clang
category: 工具链
tags: C++
keywords:
description:
---

# Stage

g++ opencv_test.c `pkg-config opencv --libs --cflags opencv` -o drawing




# Gcc

# Update to state-of-the-art
```
## Website : http://ftp.gnu.org/gnu/gcc/gcc-6.1.0/
## The default mode has been changed to -std=gnu++14
## In Cmake : set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++14")
tar -zxvf gcc-6.1.0.tar.gz
cd gcc-6.1.0
./contrib/download_prerequisites
./configure --prefix=/usr/local/gcc61 --enable-checking=release --enable-languages=c,c++ --disable-multilib
make -j8

sudo make install
sudo mv /usr/bin/gcc /usr/bin/gcc48
sudo mv /usr/bin/g++ /usr/bin/g++48
sudo ln -s /usr/local/gcc61/bin/gcc /usr/bin/gcc
sudo ln -s /usr/local/gcc61/bin/g++ /usr/bin/g++
## check for version
gcc -v
g++ -v
```



# Library
函数库一般分为静态库和动态库两种。静态库是指编译链接时，把库文件中使用到的代码全部加入到可执行文件中，因此生成的文件比较大，但在运行时也就不再需要库文件了。其后缀名一般为”.a”。动态库与之相反，在编译链接时并没有把库文件的代码加入到可执行文件中，而是在程序执行时由运行时链接文件加载库，这样可以节省系统的开销。动态库一般后缀名为”.so”，如前面所述的libc.so.6就是动态库。
Gcc在编译时默认使用动态库。


# compiler parameter

* -O0 -O1 -O2 -O3
optimization from none to high level

* -std=c++11.c++1y,c++1z

* -g
在可执行程序中包含标准调试信息,GCC 提供了一个很多其他 C 编译器里没有的特性, 在 GCC 里你能使-g 和 -O(产生优化代码)联用。

* -ggdb
具体来说，-g产生的debug信息是OS native format， GDB可以使用之。而-ggdb产生的debug信息更倾向于给GDB使用的。
所以，如果你用的GDB调试器，那么使用-ggdb选项。如果是其他调试器，则使用-g。
可以同时设置，保证程序包含调试信息

* -pg
告诉 GCC 在编译好的程序里加入额外的代码。运行程序时, 产生 gprof 用的剖析信息以显示你的程序的耗时情况。

* -w
关闭所有告警

* -Wall
允许发出Gcc提供的大部分警告，除了以-W开头的警告

* -fPIC
作用于编译阶段，告诉编译器产生与位置无关代码(Position-Independent Code)，
则产生的代码中，没有绝对地址，全部使用相对地址，故而代码可以被加载器加载到内存的任意
位置，都可以正确的执行。这正是共享库所要求的，共享库被加载时，在内存的位置不是固定的。




# Clang
# why use it?
[Clang vs Other Open Source Compilers](http://clang.llvm.org/comparison.html)

# INSTALL
sudo apt-get install clang
sudo update-alternatives --config c++
sudo update-alternatives --config cc # not necessary


```
# From suource (too long)
sudo apt-get install subversion

svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
# blabla...
```

# Test
```
#include <iostream>
#include <string>

class MyClass {
public:
std::string s ="Hello, world\n"; // Non-static data member initializer
};

int main()
{
   std::cout << MyClass().s;
}
```
clang++ test.cpp 
# get error
clang++ test.cpp -std=c++11
# ok

# Ref
[Stackflow](http://stackoverflow.com/questions/7031126/switching-between-gcc-and-clang-llvm-using-cmake)