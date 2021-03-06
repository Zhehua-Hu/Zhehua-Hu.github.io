---
layout: post
title: SSD配置与运行
category: 工程录
tags: DeepLearning
keywords:
description:
---


SSD Guidance
===

# My Setting
Ubuntu16.04+CUDA8.0+Cudnn5.0

# Setup
## Download
git clone https://github.com/weiliu89/caffe.git
cd caffe
git checkout ssd

sudo apt-get install python-skimage　python-protobuf

## Config
gedit ~/.bashrc
export PYTHONPATH=/home/zhehua/caffe/python:$PYTHONPATH
source ~/.bashrc
echo $PYTHONPATH


cp Makefile.config.example Makefile.config
gedit Makefile.config

### change "Makefile.config" as below :
####[1]
USE_CUDNN := 1
####[2]
OPENCV_VERSION := 3
####[3]
WITH_PYTHON_LAYER := 1
HDF5_DIRS :=/usr/local/hdf5/
# Whatever else you find you need goes here.
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include　　$(HDF5_DIRS)/include /usr/include/hdf5/serial/
LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib　$(HDF5_DIRS)/lib

### change "Makefile" as below :
LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_serial_hl hdf5_serial
LIBRARIES += glog gflags protobuf boost_system boost_filesystem boost_regex m hdf5_serial_hl hdf5_serial

## Build
make -j8
#### Make sure to include $CAFFE_ROOT/python to your PYTHONPATH.
make py
make test -j8

#### Test
python
import caffe

## Dataset & Model
mkdir $HOME/data
cd $HOME/data
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtrainval_06-Nov-2007.tar
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2007/VOCtest_06-Nov-2007.tar
# Extract the data.
tar -xvf VOCtrainval_11-May-2012.tar
tar -xvf VOCtrainval_06-Nov-2007.tar
tar -xvf VOCtest_06-Nov-2007.tar

cd <Your CAFFE_ROOT>
./data/VOC0712/create_list.sh

### Important
gedit ./data/VOC0712/create_data.sh

#### Change Below
cur_dir=$(cd $( dirname ${BASH_SOURCE[0]} ) && pwd )
root_dir=$cur_dir/../..
#### To
root_dir=<Your CAFFE_ROOT>
./data/VOC0712/create_data.sh

## Do your Train/Eval

