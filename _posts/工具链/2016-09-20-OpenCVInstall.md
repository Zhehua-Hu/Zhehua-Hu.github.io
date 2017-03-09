---
layout: post
title: OpenCV各版本安装原理
category: 工具链
tags: OpenCV
keywords: 
description: 
---



```
# uninstall
sudo apt-get purge libopencv*
sudo apt-get autoremove opencv-data

#??? not sure if works
sudo rm /usr/local/share/OpenCV -r
sudo rm libopencv*

# install
sudo apt-get -y install build-essential
sudo apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

sudo apt-get -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libdc1394-22-dev libgphoto2-dev

```



```
# if necessary
sudo apt-get -y install libopencv-dev libdc1394-22 libjpeg-dev libpng12-dev libtiff4-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev  libqt4-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils python-scipy python-pip python-virtualenv

mkdir build && cd build
# Choose only one type
#[1] Common Installation
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

#[2] Add opencv_contrib(version > 3)
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..

#[3] Choose certain Macros
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..

#[4] For TX1
# [Config](http://blog.csdn.net/Jalong_Ma/article/details/52743923)
cmake -DWITH_CUDA=ON -DCUDA_ARCH_BIN="5.3" -DCUDA_ARCH_PTX="" -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DCUDA_FAST_MATH=ON ..
# or
cmake CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -DCUDA_ARCH_BIN="5.3" -DCUDA_ARCH_PTX="" -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DCUDA_FAST_MATH=ON ..

# Error: NppiGraphcutState
gedit ../modules/cudalegacy/src/graphcuts.cpp
#if !defined (HAVE_CUDA) || defined (CUDA_DISABLER)
->
#if !defined (HAVE_CUDA) || defined (CUDA_DISABLER)  || (CUDART_VERSION >= 8000)
```


    # Error: ippcv
    # see: http://askubuntu.com/questions/734738/cmake-opencv-installation-issue
    # download: http://www.linuxfromscratch.org/blfs/view/svn/general/opencv.html
    # copy to opencv/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/
    # sudo cp ~/linuxware/OPENCV3_1n/opencv-3.1.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_lnx/lib/intel64/libippicv.a /usr/local/lib
    # cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

    make -j12
    sudo make install -j12


    # Ubuntu16.04 Opencv3
    # http://www.pyimagesearch.com/2015/07/20/install-opencv-3-0-and-python-3-4-on-ubuntu/



