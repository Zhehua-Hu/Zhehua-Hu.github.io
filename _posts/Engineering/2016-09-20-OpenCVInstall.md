---
layout: post
title: "OpenCV安装讲解"
category: 工具链
tags: OpenCV
keywords: 
description: 
---









## 安装依赖

```
sudo apt-get -y install build-essential
sudo apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libdc1394-22-dev libgphoto2-dev
```

## 对某些设备可能需要安装

```
sudo apt-get -y install libopencv-dev libdc1394-22 libjpeg-dev libpng12-dev libtiff4-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev  libqt4-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils python-scipy python-pip python-virtualenv
```

## 编译安装流程

### 创建build文件夹并进入
```
mkdir build && cd build
```

### 选择一种安装方式，并配置cmake

* 最简单安装

```
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
```

* 对于安装OpenCV3以上版本，部分“新式”算法独立在opencv_contrib，如需安装，需下载后制定位置

```
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
```

* TX1安装
[参考](http://blog.csdn.net/Jalong_Ma/article/details/52743923)

```
cmake CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -DCUDA_ARCH_BIN="5.3" -DCUDA_ARCH_PTX="" -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DCUDA_FAST_MATH=ON ..
```

若遇到Error: NppiGraphcutState

```
gedit ../modules/cudalegacy/src/graphcuts.cpp
# 将下句
#if !defined (HAVE_CUDA) || defined (CUDA_DISABLER)
# 改为
#if !defined (HAVE_CUDA) || defined (CUDA_DISABLER)  || (CUDART_VERSION >= 8000)
```

### 编译并安装
```
make -j12
sudo make install -j12
```

## 卸载

```
sudo rm /usr/local/share/OpenCV -r
sudo rm libopencv*
sudo apt-get purge libopencv*
sudo apt-get autoremove opencv-data
```


## 常见问题
### Error: ippcv
[Ref](http://askubuntu.com/questions/734738/cmake-opencv-installation-issue)

download: <http://www.linuxfromscratch.org/blfs/view/svn/general/opencv.html>

copy to opencv/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/

sudo cp ~/linuxware/OPENCV3_1n/opencv-3.1.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_lnx/lib/intel64/libippicv.a /usr/local/lib
 
### Ubuntu16.04 OpenCV3绑定python3.x
<http://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on
-ubuntu/>
  
