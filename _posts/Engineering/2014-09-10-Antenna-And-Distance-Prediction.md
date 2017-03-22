---
layout: post
title: "天线笔记与无线链路预测"
category: 工程录
tags: 
    工程录
keywords: 
description: 
---




## 天线性质
天线基于互感定理，同一天线作为发射或接受的基本特性参数是相同的。

## 性能因素

### 尺寸

### 位置

### 环境

### 极化方向

* 天线电场方向

* 接受天线的极化方向需等于电磁波的极化方向

* 分类

    * 全向天线/圆极化

    * 定向极化

### 频段
定义

* SWR小于等于1.5时

* 天线增益下降3dB时

### 阻抗匹配
常见特性阻抗50或70，与馈线匹配


## 无线链路预测

###　电磁波传输途径

* 直接波  
由于地球是圆的，一个电台一般只能传播70km

* 电离层反射波

    * 超短波

    * 由于是反射，所以不同波长有不同范围

    * 短驳

    * 地表波

###　电磁波传输特性
* 波的能量随距离呈幂级数递减

* 频率越高，越难越过障碍


###　常见环境及阻挡物类型与衰减值/dB

* 环境及阻挡物类型 衰减值/dB

* 楼层底板 30

* 砖墙上的窗 2

* 办公室隔墙 6

* 办公室墙上的金属门 6

* 煤渣砌块墙体　6

* 砖墙上的金属门　6

* 金属门旁的砖墙　6

---
### 基于Mathematica的无线链路预测
[.nb下载]({{site.zhehua.files}}/无线链路距离预测.nb)


<script type="text/javascript" src="http://www.wolfram.com/cdf-player/plugin/v2.1/cdfplugin.js"></script>
<script type="text/javascript">
var cdf = new cdfplugin();
cdf.setDefaultContent('<a href="http://www.wolfram.com/cdf-player/"><img  src="{{site.zhehua.files}}/无线链路距离预测.png"></a>');
cdf.embed('{{site.zhehua.files}}/无线链路距离预测.cdf', 460, 574);
</script>

