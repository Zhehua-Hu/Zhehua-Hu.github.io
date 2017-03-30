---
layout: post
title: demo
category: 
tags: demo
keywords: 
description: 
---



[Installation](http://caffe.berkeleyvision.org/installation.html#cmake-build)


# update gcc version larger than 4.9 will cause error(for cuda7.5)
## Error ! : unsupported GNU version! gcc versions later than 4.9 are not supported!

# basic ______________________________________________________
sudo apt-get install build-essential 
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler

#I have boost from source build
#sudo apt-get -y install --no-install-recommends libboost-all-dev

# Remaining dependencies, 14.04
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

# BLAS
sudo apt-get install libatlas-base-dev

# CUDA
## Nvidia web :https://developer.nvidia.com/cuda-downloads
## Download, and install as below
## Do not double click to run it !
md5sum cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
## 5cf65b8139d70270d9234d5ff4d697c7
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install cuda

## Please reboot !!!

##
sudo su
sudo echo 'PATH=/usr/local/cuda/bin:$PATH' >> /etc/profile
sudo echo 'export PATH' >> /etc/profile
source /etc/profile
sudo touch /etc/ld.so.conf.d/cuda.conf
sudo echo '/usr/local/cuda/lib64' >> /etc/ld.so.conf.d/cuda.conf
sudo ldconfig
exit
## check if neccessary
gedit /etc/profile /etc/ld.so.conf.d/cuda.conf

# cuDNN
## Nvidia web : https://developer.nvidia.com/cudnn
## or https://developer.nvidia.com/rdp/cudnn-download
## Download
tar -zxvf cudnn-7.5-linux-x64-v5.0-ga.tgz
cd cuda
sudo cp include/* /usr/local/include/
sudo cp lib64/libcudnn* /usr/local/lib/
sudo ldconfig -v

# change cudnn version
sudo rm /usr/local/include/cudnn*
sudo rm /usr/local/lib/libcudnn*

# move
sudo mv /usr/local/include/cudnn.h /home/ubuntu/test/cudnn_old
sudo mv /usr/local/lib/libcudnn* /home/ubuntu/test/cudnn_old

# check
ls -l /usr/local/include/cudnn* /usr/local/lib/libcudnn*


# show version
ll /usr/local/cuda-<Tab>



# make samples
cd /usr/local/cuda/samples
sudo make all -j12
## if you have build it before with raising error,and make again
## sudo make clean

cd /usr/local/cuda/samples/bin/x86_64/linux/release
./deviceQuery
## show something like
# ./deviceQuery Starting...
# make 
# CUDA Device Query (Runtime API) version (CUDART static linking)
# 
# Detected 1 CUDA Capable device(s)

git clone https://github.com/BVLC/caffe

# caffe
# cd into caffe folder
cp Makefile.config.example Makefile.config
gedit Makefile.config
# change it as below :
USE_CUDNN := 1
OPENCV_VERSION := 3
WITH_PYTHON_LAYER := 1

WITH_PYTHON_LAYER := 1
HDF5_DIRS :=/usr/local/hdf5/
# Whatever else you find you need goes here.
INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include　　$(HDF5_DIRS)/include /usr/include/hdf5/serial/
LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib　$(HDF5_DIRS)/lib

LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_serial_hl hdf5_serial
LIBRARIES += glog gflags protobuf boost_system boost_filesystem boost_regex m hdf5_serial_hl hdf5_serial
make all -j12
# if error raise
# do what you do not do yet
# sudo ldconfig
# make clean
make pycaffe -j12

make test -j12
make runtest -j12

## end of result
## [----------] Global test environment tear-down
## [==========] 2069 tests from 277 test cases ran. (450389 ms total)
## [  PASSED  ] 2069 tests.

# pycaffe
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler protobuf-c-compiler protobuf-compiler 
sudo apt-get install -y python-numpy python-scipy python-matplotlib python-sklearn python-skimage python-h5py python-protobuf python-leveldb python-networkx python-nose python-yaml python-pandas python-gflags Cython ipython
sudo pip install cython easydict
# you need opencv


# add in zshrc
export PYTHONPATH=/home/zhehua/deepLearning/caffe/python:$PYTHONPATH

# test caffe
python
import caffe

#______________________________________________________________________
#FAQ
# HDF5
## see current version: https://www.hdfgroup.org/ftp/HDF5/current/src
wget https://www.hdfgroup.org/ftp/HDF5/current/src/*****.gz
tar -xzvf ******
cd ***********
./configure --prefix=/usr/local/hdf5/
make -j12
make check -j12 # run test suite
sudo make install -j12
sudo make check-install -j12 # verify installation

# pip problem
## see https://pip.pypa.io/en/latest/installing/
sudo apt-get remove --purge python-pip
wget https://bootstrap.pypa.io/get-pip.py
# MUST have sudo
sudo python get-pip.py
## upgrage pip
## On Linux or OS X
pip install -U pip
## On Windows
python -m pip install -U pip
pip --version


#________________________________________________________________________________
# py-faster-rcnn
## YOU NEED have configured raw caffe first!
## use cuDNNv4 only
git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
cd py-faster-rcnn/

FRCN_ROOT=`pwd`
cd $FRCN_ROOT/lib
make -j12

cd $FRCN_ROOT/caffe-fast-rcnn
cp Makefile.config.example Makefile.config
gedit Makefile.config
# change it as below :
# USE_CUDNN := 1
# OPENCV_VERSION := 3
# WITH_PYTHON_LAYER := 1

make -j12 && make pycaffe
#python: import caffe

cd $FRCN_ROOT
./data/scripts/fetch_faster_rcnn_models.sh
cd $FRCN_ROOT
./tools/demo.py
#__done

# ERRORS
#_nms

ln -s /home/ubuntu/py-faster-rcnn/lib/nms/gpu_nms.so /home/ubuntu/py-faster-rcnn/lib/nms/libgpu_nms.so
ln -s $FRCN_ROOT/lib/nms/gpu_nms.so $FRCN_ROOT/lib/nms/libgpu_nms.so

cd $FRCN_ROOT/caffe-fast-rcnn
protoc src/caffe/proto/caffe.proto --cpp_out=.
mkdir include/caffe/proto
mv src/caffe/proto/caffe.pb.h include/caffe/proto

# make test -j12 will raise error
# src/caffe/test/test_smooth_L1_loss_layer.cpp:11:35: fatal error: caffe/vision_layers.hpp: No such file or directory
 #include "caffe/vision_layers.hpp"
# comment this include as:
#include "caffe/vision_layers.hpp"
make test -j12
make runtest -j12

# if needed
# Anaconda
bash ~/Downloads/Anaconda2-4.1.1-Linux-x86_64.sh
You may wish to edit your .bashrc or prepend the Anaconda2 install location:
$ export PATH=/home/zhehua/anaconda2/bin:$PATH

# Visualization
sudo apt-get install graphviz
sudo -H pip install pydot

sudo python python/draw_net.py examples/mnist/lenet_train_test.prototxt examples/images/lenet.svg --rankdir=BT

sudo python python/draw_net.py /home/zhehua/caffe/examples/net_surgery/my_conv.prototxt examples/images/my_conv.svg

# digits 5
sudo apt-get install --no-install-recommends git graphviz python-dev python-flask python-flaskext.wtf python-gevent python-h5py python-numpy python-pil python-pip python-protobuf python-scipy

DIGITS_ROOT=~/digits
git clone https://github.com/NVIDIA/DIGITS.git $DIGITS_ROOT
sudo pip install -r $DIGITS_ROOT/requirements.txt
sudo pip install -e $DIGITS_ROOT
cd $DIGITS_ROOT
./digits-devserver

# make log



```
CXX .build_release/src/caffe/proto/caffe.pb.cc
CXX src/caffe/blob.cpp
CXX src/caffe/util/upgrade_proto.cpp
CXX src/caffe/util/db_leveldb.cpp
CXX src/caffe/util/hdf5.cpp
CXX src/caffe/layers/crop_layer.cpp
CXX src/caffe/layers/threshold_layer.cpp
CXX src/caffe/layers/cudnn_relu_layer.cpp
CXX src/caffe/layers/softmax_layer.cpp
CXX src/caffe/layers/prelu_layer.cpp
CXX src/caffe/layers/tile_layer.cpp
CXX src/caffe/layers/multinomial_logistic_loss_layer.cpp
CXX src/caffe/layers/silence_layer.cpp
CXX src/caffe/layers/lrn_layer.cpp
CXX src/caffe/layers/hdf5_output_layer.cpp
CXX src/caffe/layers/bnll_layer.cpp
CXX src/caffe/layers/rnn_layer.cpp
CXX src/caffe/layers/cudnn_lcn_layer.cpp
CXX src/caffe/layers/hdf5_data_layer.cpp
CXX src/caffe/layers/conv_layer.cpp
CXX src/caffe/layers/concat_layer.cpp
CXX src/caffe/layers/scale_layer.cpp
CXX src/caffe/layers/im2col_layer.cpp
CXX src/caffe/layers/parameter_layer.cpp
CXX src/caffe/layers/embed_layer.cpp
CXX src/caffe/layers/cudnn_pooling_layer.cpp
CXX src/caffe/layers/memory_data_layer.cpp
CXX src/caffe/layers/flatten_layer.cpp
CXX src/caffe/layers/lstm_layer.cpp
CXX src/caffe/layers/eltwise_layer.cpp
CXX src/caffe/layers/relu_layer.cpp
CXX src/caffe/layers/hinge_loss_layer.cpp
CXX src/caffe/layers/cudnn_conv_layer.cpp
CXX src/caffe/layers/batch_norm_layer.cpp
CXX src/caffe/layers/bias_layer.cpp
CXX src/caffe/layers/lstm_unit_layer.cpp
CXX src/caffe/layers/contrastive_loss_layer.cpp
CXX src/caffe/layers/log_layer.cpp
CXX src/caffe/layers/input_layer.cpp
CXX src/caffe/layers/slice_layer.cpp
CXX src/caffe/layers/window_data_layer.cpp
CXX src/caffe/layers/pooling_layer.cpp
CXX src/caffe/layers/filter_layer.cpp
CXX src/caffe/layers/dummy_data_layer.cpp
CXX src/caffe/layers/tanh_layer.cpp
CXX src/caffe/layers/split_layer.cpp
CXX src/caffe/layers/base_data_layer.cpp
CXX src/caffe/layers/reduction_layer.cpp
CXX src/caffe/layers/sigmoid_cross_entropy_loss_layer.cpp
CXX src/caffe/layers/cudnn_tanh_layer.cpp
CXX src/caffe/layers/recurrent_layer.cpp
CXX src/caffe/layers/base_conv_layer.cpp
CXX src/caffe/layers/infogain_loss_layer.cpp
CXX src/caffe/layers/batch_reindex_layer.cpp
CXX src/caffe/layers/inner_product_layer.cpp
CXX src/caffe/layers/mvn_layer.cpp
CXX src/caffe/layers/loss_layer.cpp
CXX src/caffe/layers/image_data_layer.cpp
CXX src/caffe/layers/deconv_layer.cpp
CXX src/caffe/layers/exp_layer.cpp
CXX src/caffe/layers/absval_layer.cpp
CXX src/caffe/layers/elu_layer.cpp
CXX src/caffe/layers/accuracy_layer.cpp
CXX src/caffe/layers/dropout_layer.cpp
CXX src/caffe/layers/spp_layer.cpp
CXX src/caffe/layers/argmax_layer.cpp
CXX src/caffe/layers/power_layer.cpp
CXX src/caffe/layers/cudnn_sigmoid_layer.cpp
CXX src/caffe/layers/euclidean_loss_layer.cpp
CXX src/caffe/layers/softmax_loss_layer.cpp
CXX src/caffe/layers/cudnn_lrn_layer.cpp
CXX src/caffe/layers/sigmoid_layer.cpp
CXX src/caffe/layers/reshape_layer.cpp
CXX src/caffe/layers/neuron_layer.cpp
CXX src/caffe/layers/data_layer.cpp
CXX src/caffe/layers/cudnn_softmax_layer.cpp
CXX src/caffe/data_reader.cpp
CXX src/caffe/data_transformer.cpp
CXX src/caffe/common.cpp
CXX src/caffe/layer.cpp
CXX src/caffe/syncedmem.cpp
CXX src/caffe/internal_thread.cpp
CXX src/caffe/net.cpp
CXX src/caffe/layer_factory.cpp
CXX src/caffe/solver.cpp
NVCC src/caffe/solvers/adadelta_solver.cu
NVCC src/caffe/solvers/adagrad_solver.cu
NVCC src/caffe/solvers/adam_solver.cu
NVCC src/caffe/solvers/rmsprop_solver.cu
NVCC src/caffe/solvers/sgd_solver.cu
NVCC src/caffe/solvers/nesterov_solver.cu
NVCC src/caffe/util/im2col.cu
NVCC src/caffe/util/math_functions.cu
NVCC src/caffe/layers/softmax_loss_layer.cu
NVCC src/caffe/layers/concat_layer.cu
NVCC src/caffe/layers/cudnn_tanh_layer.cu
NVCC src/caffe/layers/power_layer.cu
NVCC src/caffe/layers/hdf5_output_layer.cu
NVCC src/caffe/layers/relu_layer.cu
NVCC src/caffe/layers/tile_layer.cu
NVCC src/caffe/layers/base_data_layer.cu
NVCC src/caffe/layers/filter_layer.cu
NVCC src/caffe/layers/hdf5_data_layer.cu
NVCC src/caffe/layers/cudnn_pooling_layer.cu
NVCC src/caffe/layers/tanh_layer.cu
NVCC src/caffe/layers/log_layer.cu
NVCC src/caffe/layers/prelu_layer.cu
NVCC src/caffe/layers/split_layer.cu
NVCC src/caffe/layers/inner_product_layer.cu
NVCC src/caffe/layers/bnll_layer.cu
NVCC src/caffe/layers/deconv_layer.cu
NVCC src/caffe/layers/softmax_layer.cu
NVCC src/caffe/layers/cudnn_lrn_layer.cu
NVCC src/caffe/layers/sigmoid_layer.cu
NVCC src/caffe/layers/lstm_unit_layer.cu
NVCC src/caffe/layers/im2col_layer.cu
NVCC src/caffe/layers/euclidean_loss_layer.cu
NVCC src/caffe/layers/eltwise_layer.cu
NVCC src/caffe/layers/exp_layer.cu
NVCC src/caffe/layers/batch_norm_layer.cu
NVCC src/caffe/layers/sigmoid_cross_entropy_loss_layer.cu
NVCC src/caffe/layers/contrastive_loss_layer.cu
NVCC src/caffe/layers/cudnn_lcn_layer.cu
NVCC src/caffe/layers/cudnn_sigmoid_layer.cu
NVCC src/caffe/layers/slice_layer.cu
NVCC src/caffe/layers/cudnn_relu_layer.cu
NVCC src/caffe/layers/conv_layer.cu
NVCC src/caffe/layers/absval_layer.cu
NVCC src/caffe/layers/mvn_layer.cu
NVCC src/caffe/layers/crop_layer.cu
NVCC src/caffe/layers/silence_layer.cu
NVCC src/caffe/layers/recurrent_layer.cu
NVCC src/caffe/layers/cudnn_conv_layer.cu
NVCC src/caffe/layers/cudnn_softmax_layer.cu
NVCC src/caffe/layers/pooling_layer.cu
NVCC src/caffe/layers/scale_layer.cu
NVCC src/caffe/layers/reduction_layer.cu
NVCC src/caffe/layers/threshold_layer.cu
NVCC src/caffe/layers/embed_layer.cu
NVCC src/caffe/layers/batch_reindex_layer.cu
NVCC src/caffe/layers/dropout_layer.cu
NVCC src/caffe/layers/bias_layer.cu
NVCC src/caffe/layers/elu_layer.cu
NVCC src/caffe/layers/lrn_layer.cu
CXX tools/upgrade_net_proto_binary.cpp
CXX tools/net_speed_benchmark.cpp
CXX tools/convert_imageset.cpp
CXX tools/caffe.cpp
CXX tools/extract_features.cpp
CXX tools/compute_image_mean.cpp
CXX tools/finetune_net.cpp
CXX tools/train_net.cpp
CXX tools/upgrade_solver_proto_text.cpp
CXX tools/device_query.cpp
CXX tools/test_net.cpp
CXX tools/upgrade_net_proto_text.cpp
CXX examples/cpp_classification/classification.cpp
CXX examples/mnist/convert_mnist_data.cpp
CXX examples/siamese/convert_mnist_siamese_data.cpp
CXX examples/cifar10/convert_cifar_data.cpp
AR -o .build_release/lib/libcaffe.a
LD -o .build_release/lib/libcaffe.so.1.0.0-rc3
CXX/LD -o .build_release/tools/upgrade_net_proto_binary.bin
CXX/LD -o .build_release/tools/net_speed_benchmark.bin
CXX/LD -o .build_release/tools/convert_imageset.bin
CXX/LD -o .build_release/tools/caffe.bin
CXX/LD -o .build_release/tools/extract_features.bin
CXX/LD -o .build_release/tools/compute_image_mean.bin
CXX/LD -o .build_release/tools/finetune_net.bin
CXX/LD -o .build_release/tools/train_net.bin
CXX/LD -o .build_release/tools/upgrade_solver_proto_text.bin
CXX/LD -o .build_release/tools/device_query.bin
CXX/LD -o .build_release/tools/test_net.bin
CXX/LD -o .build_release/tools/upgrade_net_proto_text.bin
CXX/LD -o .build_release/examples/cpp_classification/classification.bin
CXX/LD -o .build_release/examples/mnist/convert_mnist_data.bin
CXX/LD -o .build_release/examples/siamese/convert_mnist_siamese_data.bin
CXX/LD -o .build_release/examples/cifar10/convert_cifar_data.bin
```



