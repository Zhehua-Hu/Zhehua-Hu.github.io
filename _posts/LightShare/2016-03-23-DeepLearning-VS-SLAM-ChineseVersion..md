---
layout: post
title: "实时SLAM的未来, 深度学习 vs SLAM[译]"
category: 轻分享
tags: 
    轻分享
keywords: 
description: 
---



2015年12月的计算机视觉国际会议
(ICCV)充满了深度学习的讨论，但在说卷积神经网络已经笑到最后之前，让我们先看一看另一类“非学习型”的计算机视觉几何领域在做些什么。即时定位与地图构建（Simultaneous
Localization and Mapping, 或者简称为
SLAM），在经过计算机视觉与机器人领域的先驱多年耕耘后，现在被认为是相关领域最重要的算法之一。今天我将总结一下最近的ICCV's [Future
of Real-Time
SLAM](http://wp.doc.ic.ac.uk/thefutureofslam/programme/)研讨会的关键内容（2015年12月18日举办）。

今天的博文将包括：

-   关于SLAM的简短介绍

-   总结研讨会7个讲座的主要内容

-   关于研讨会尾声关于深度学习专题探讨的一些实用分析

    ![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\slammies2.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/1c306d159bf6853085e19c663716c355.png)

    **以上是多种SLAM算法的可视化效果？你能区分几种？**

第一节：为什么SLAM如此重要
--------------------------

Visual
SLAM算法能即时地建立周围环境的3D地图并且跟踪当前摄像头与姿态（可能手持或安装在移动机器人上）。SLAM算法是卷积神经网络与深度学习的补充，因为SLAM关注几何信息，而深度学习关注感知/识别信息。

如果你想让一个机器人走向冰箱，避免碰到墙，那就使用SLAM；如果你想让机器人识别冰箱里的东西，使用卷积神经网络。

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\structureFromMotion.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/f0bb08cf542b6c80671254fac3f0e1c2.png)

**SfM/SLAM**的基本概念：根据相机的内参与图像，通过计算与预估得到相机的运动与环境结构。更多参考[openMVG
website](http://openmvg.readthedocs.org/en/latest/).

SLAM对应于实时的 **S**tructure **f**rom **M**otion (SfM)。而Visual SLAM 或
Vision-based SLAM主要用来区分使用昂贵的激光雷达和惯性导航器件
(IMUs)的SLAM算法。单目SLAM仅仅使用1个摄像头，而非单目（或者叫多目）SLAM则使用提前校准与固定基线后的多个摄像头。SLAM正是使用了计算机视觉中的几何相关算法来解决问题。实际上，CMU的机器人实验室将研究生所上的计算机视觉课程划分为[Learning-based
Methods in Vision](http://graphics.cs.cmu.edu/courses/16-824-S15/index.html)
（基于学习的视觉）与 [Geometry-Based Methods in
Vision](http://www.cs.cmu.edu/%7Ehebert/geom.html)（基于几何的视觉）。

**Structure from Motion vs 视觉 SLAM**

SfM和
SLAM关注的是很相近的领域，但SfM传统上主要用于线下（即非实时），而SLAM逐渐转向低功耗/实时/单个的RGB相机。今天很多SfM领域的专家都在为世界上最大的科技巨头们工作，帮助他们建立更好的地图。要设计成熟的地图如Google地图需要对多视几何，SfM和SLAM的深入理解。

典型的SfM问题如下：给定一系列对室外某一建筑（如体育馆）的图片，需要建立该建筑的3D模型并得到相机的姿态变化。相机拍摄的图片由线下处理，所需时间从几小时到几天不等。

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\Colosseum.jpg]({{site.zhehua.images}}/misc/tomasz_blog_slam/aa8cda486ec7fa8bbe8302b7efeb946b.jpg)

**SfM
Software**: 使用的[Bundler](http://www.cs.cornell.edu/%7Esnavely/bundler/)，一个非常成熟的
SfM 开源库

下面是一些相关的开源库

-   [Bundler](http://www.cs.cornell.edu/%7Esnavely/bundler/), an open-source
    Structure from Motion toolkit

-   [Libceres](http://ceres-solver.org/), a non-linear least squares minimizer
    (useful for bundle adjustment problems)

-   Andrew Zisserman's [Multiple-View Geometry MATLAB
    Functions](http://www.robots.ox.ac.uk/%7Evgg/hzbook/code/)

**视觉SLAM vs 自动驾驶**

尽管自动驾驶汽车时SLAM最重要的应用领域之一，但研讨会组织者之一Andrew
Davison认为用于自动驾驶的SLAM应拥有独立的研究领域（而且我们可以从演讲稿看出，这次研讨会没有一个人发言谈到过自动驾驶汽车）。

对未来而言，仍然用研究者的视角来看待SLAM仍然很有意义，而不要将它全部局限在最热的某个应用上。因为自动驾驶汽车牵扯很多系统级的领域知识与实现技巧，而研究SLAM只需要有个摄像头，算法知识以及肯钻研就行。

作为一个研究领域，视觉SLAM实在是对研究生非常友好，你们可以先在实验室环境学习、应用SLAM，等有机会了再去考虑应用到无人汽车这样费钱的平台上去。

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\1948541.jpg]({{site.zhehua.images}}/misc/tomasz_blog_slam/be103e52d794028ee65c6d0438211733.jpg)

**Google无人车的感知系统**

（来源：IEEE Spectrum's "[How Google's Self-Driving Car
Works](http://spectrum.ieee.org/automaton/robotics/artificial-intelligence/how-google-self-driving-car-works)"）

**相关：** March 2015 blog post, [Mobileye's quest to put Deep Learning inside
every new
car](http://www.computervisionblog.com/2015/03/mobileyes-quest-to-put-deep-learning.html).

[One way Google's Cars Localize
Themselves](http://mappingignorance.org/2014/04/07/one-way-googles-cars-localize/)

第二节：实时SLAM的未来
----------------------

现在我要正式总结”实时SLAM的未来“研讨会上的讲座。 [Andrew
Davison](http://www.doc.ic.ac.uk/%7Eajd/index.html)首先回顾了激动人心的过往（[15
years of vision-based
SLAM](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/slides_ajd.pdf)），这个讲座能为机器人类课程提供很好的参考。

对于那些还不知道他的人做些介绍，他是赫赫有名的伦敦帝国理工学院的教授。最为人称道的工作就是他于2003年奠基的单目SLAM系统。他被认为是第一位向世界展示如何通过一个相机建立SLAM系统。在这之前，人人都认为至少需要双目（也就是2个）相机才行。这些年，他的工作已经促进了如Dyson这类公司的发展速度，提高了他们的机器人的功能。

我还记得Davison教授在[2007](http://www.cs.bris.ac.uk/Research/Vision/Realtime/bmvctutorial/)
的BMVC上视觉SLAM讲座，令人惊讶的是现在SLAM的变化如此之小，至少与视觉领域里机器学习方法的大踏步相比。在过去8年里，物体识别领域已经经历了2-3个小的变革，然而今日的SLAM与8年前相比却没什么两样。要关注SLAM的进展的最好方法就是看看一些最成功和值得关注的实现。在Davison的讲座中，他讨论了过去10-15年里一些杰出实现。

-   **MonoSLAM**

-   **PTAM**

-   **FAB-MAP**

-   **DTAM**

-   **KinectFusion**

**Davison vs Horn: 机器视觉的新篇章**

Davison同时也提到了他正在写一个关于机器视觉的新书，这将是计算机视觉、机器人和人工智能领域的盛宴。最近的机器视觉权威著作是由B.K.
Horn 完成的(1986，[Robot Vision
book](https://mitpress.mit.edu/books/robot-vision))，是时候更新了！

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\robotvision-01.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/0d55b05aac05f9213643befb6e908d82.png)

**一本全新的机器视觉书?**

尽管我很乐意去阅读一本蕴含机器视觉哲学深意的大部头，但我更愿意这本书能关注于实用的机器视觉算法，比如以下经典

-   Hartley and Zissermann 合著的[Multiple View
    Geometry](http://www.robots.ox.ac.uk/%7Evgg/hzbook/)

-   Thrun, Burgard, and Fox的[Probabilistic
    Robotics](http://www.probabilistic-robotics.org/)

-   **Related**: Davison's [15-years of vision-based
    SLAM](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/slides_ajd.pdf) slides

### Talk 1：连续轨迹跟踪

[Christian
Kerl](http://vision.in.tum.de/members/kerl)作了第一场讲座，主题关于使用dense
tracking方法估算连续时间的轨迹。这其中关键点出了，大多数SLAM系统仅仅使用离散的时刻来估算相机姿态（相当于每秒使用25个离散的帧）。  
  


![kerl.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/3e1ec777d17ccd163efaa69c93c70a3d.png)

**Continuous Trajectories vs Discrete Time Points.**

SLAM/SfM 离散的时间，为什么不用连续的？

Kerl的讲座主要目的是消除卷帘快门（rolling
shutter）成像不利的一面。他给出的演示系统证明他确实把精力放在建模并抑制卷帘快门的不利影响。

![shutter.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/887c0b217612e13255f3cb38c6e8649d.png)

**Undoing the damage of rolling shutter in Visual SLAM.**

**Related:** Kerl's [Dense continous-time tracking and
mapping](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/kerl_etal_iccv2015_futureofslam_talk.pdf) slides.  
**Related: **Dense Continuous-Time Tracking and Mapping with Rolling Shutter
RGB-D Cameras (C. Kerl, J. Stueckler, D. Cremers), In IEEE International
Conference on Computer Vision (ICCV), 2015.
[[pdf](http://vision.in.tum.de/_media/spezial/bib/kerl15iccv.pdf)]

### Talk 2：半稠密直接SLAM

LSD-SLAM是2014年ECCV出现的，现在认识我最喜欢的SLAM系统之一！[Jakob
Engel](http://vision.in.tum.de/members/engelj)演示了这个最酷炫的SLAM系统。LSD-SLAM是大规模直接SLAM的缩写。LSD-SLAM的重要之处在于它并不使用任何角点或局部特征。直接跟踪使用所有帧的图像，利用Huber
loss鲁棒性高的coarse-to-fine
算法。这与基于特征点的方法很不一样。它的深度估算方法使用反向深度参数化方法（这同其他SLAM系统类似），并且使用大规模或小基线的多组图像。它不依靠于特征点，而是有效地利用“纹理”来跟踪轨迹。而全局建图使用bundle
adjustment优化的姿态图，并且以上都是实时的。这种方法建立的是半稠密的地图，因为它仅仅使用图像边界上的深度信息。LSD-SLAM的地图比传统基于特征点的地图还是要稠密不少，但远没有使用Kinect的RGBD
SLAM稠密。

| [./media/image8.png](./media/image8.png) |
|------------------------------------------|


~   C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461328292378\_359\\lsd-slam.png

| **系统演示：**[LSD-SLAM](http://vision.in.tum.de/research/vslam/lsdslam) 实时生成半稠密地图与轨迹，利用的是所有帧的图像。 |   |
|---------------------------------------------------------------------------------------------------------------------------|---|


Engel向我们讲解了LSD-SLAM的多种最新进展，他们改进LSD-SLAM的有更广阔的应用空间。

**Related:** [LSD-SLAM Open-Source Code on
github](https://github.com/tum-vision/lsd_slam) [LSD-SLAM project
webpage](http://vision.in.tum.de/research/vslam/lsdslam)  
**Related: **LSD-SLAM: Large-Scale Direct Monocular SLAM (J. Engel, T. Schöps,
D. Cremers), In European Conference on Computer Vision (ECCV), 2014.
[[pdf](http://vision.in.tum.de/_media/spezial/bib/engel14eccv.pdf)]
[youtube [video](https://youtu.be/GnuQzP3gty4)]

LSD-SLAM的一种扩展是使用广角相机，称为**Omni LSD-SLAM**
。它使用的广角相机拥有基于针孔模型的普通相机没有的宽广视角（大于180°）。它第一公开是2015年的IROS
（Caruso
是第一作者）。从Engel的讲座可知，这种设计能经受对于小视角SLAM系统而言最严苛的“芭蕾动作”（定点多圈旋转）。

![omni.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/5e41a8d078fecf535b5d2c5eee8254cf.png)

**Omnidirectional LSD-SLAM Model.**

详见 [Semi-Dense Direct
SLAM](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/ICCV-SLAM-Workshop_JakobEngel.pdf) 

**Related: **Large-Scale Direct SLAM for Omnidirectional Cameras (D. Caruso, J.
Engel, D. Cremers), In International Conference on Intelligent Robots and
Systems (IROS), 2015.
 [[pdf](http://vision.in.tum.de/_media/spezial/bib/caruso2015_omni_lsdslam.pdf)]
[youtube [video](https://youtu.be/v0NqMm7Q6S8)]

**双目（Stereo）
LSD-SLAM是将普通**LSD-SLAM扩展为使用一组相机的。这有助于得到绝对尺度，并且初始化是瞬时的，对极端的纯旋转情形也没有问题。尽管单目SLAM从学术的角度来说令人激动，但要是你用的是30000美元的无人车或者10000美元的飞行器，那你最好有充足的理由不将相机组成一对。并且双目LSD-SLAM在SLAM的各项评价体系中表现都挺好。

![stereo-lsd.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/2637994d934c291a2907e1cc2b0f8b3b.png)

**Stereo LSD-SLAM在** KITTI数据集中表现优越

双目LSD-SLAM在实际中表现非常好，它使用SE（3）来优化姿态图，并使用自动曝光来纠正。自动曝光纠正的目的是使误差函数仿射光照变化。颜色空间仿射变换的内参在匹配时使用，但估计帧间误差时被丢弃。从Engel的讲座中可知，outliers（常造成像素过曝光）是一个非常需要关注的问题。

**Related:** Large-Scale Direct SLAM with Stereo Cameras (J. Engel, J.
Stueckler, D. Cremers), In International Conference on Intelligent Robots and
Systems (IROS), 2015.
 [[pdf](http://vision.in.tum.de/_media/spezial/bib/engel2015_stereo_lsdslam.pdf)]
[youtube [video](https://youtu.be/oJt3Ln8H03s)]

Engel接下来向我们展示了融合双目与惯性期间的最新进展。他使用了运行LSD-SLAM程序的无人机。无人机通过上下运动得到空间估计，并使用八叉树地图来导航。这个应用即将正式发布。

![quadrotor.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/6207807089689c3faad2ea0b662b971a.png)

**Quadrotor running Stereo LSD-SLAM.** 

此图截自2012的视频 [Engel's quadrotor youtube
video](https://youtu.be/eznMokFQmpc)

LSD-SLAM的故事也是基于特征的方法与直接方法竞争的故事，Engel客观地将它们双方的对比如下。基于特征的方法是在使用类如Harris角点的特征方法，而直接方法则使用所有帧的信息。目前（2015）来看，基于特征的方法更快，但直接方法更适合并行运算。特征方法能将Outliers逆向移除，而直接方法则没有这么方便。卷帘快门也是直接方法的一个大问题，要使用直接方法现在要么用全局快门或者使用Kerl的模型。特征方法所利用的信息不如直接方法多，但它不需要一个好的初始化，而直接方法需要利用一些技术手段来实现合适的初始化。虽然直接方法最近4年才兴盛，但它之前也经历了20年的崎岖岁月，Engel对它的未来非常乐观，我也是。

![feature-vs-direct.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/662623884d41880f6cbed05c61c3faad.png)

**基于特征 vs 直接方法**

在Engel的讲座最后，Davison询问关于语义分割的问题，而Engel表示可以考虑使用半稠密地图的靠近边界的数据。但是，我个人认为其实还是有更好的用于语义分割类似LSD的SLAM系统。半稠密SLAM使用的是靠近边界的点，而物体识别需要和这种点不同的可靠性更高的数据，这样能创建出结合几何与语义的图像算法。

**Related**: Engel's [Semi-Dense Direct SLAM
presentation](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/ICCV-SLAM-Workshop_JakobEngel.pdf)
slides

### Talk 3：大规模定位与建图之挑战

[Torsten
Sattler](https://www.graphics.rwth-aachen.de/person/21/)作了关于大规模定位与建图的讲座。它的目的是在已有地图中实现6自由度定位，特别是对手机的定位。这场讲座的关键点是，当你使用传统的基于特征方法时，存储不断增长的描述子消耗很大。而视觉词汇的方式能显著地减少内存消耗，优化描述子的存储不再成为内存使用的瓶颈。

另一个很有用的点子是，inlier的数量并不是相机姿态估计最重要的指标。当特征点集中在图像的某个部分，相机的定位效果将不能直视！一个优化的指标是“有效的inlier数量”，它考量的是inlier所在区域在整帧图像上的分布情况。要是有用的信息本来就是分布整帧图像上，那你当然最好也能在整帧图像上各处提取关键点来更好地估计相机姿态。

Sattler说实时SLAM的未来是：我们更加关注紧凑型地图的表达；更深入理解估计相机姿态所用指标的（比如减少从树上提取的特征的权重）；我们要迎接更有挑战性的场景（比如平面化的建筑，在夜晚定位等）。

![mobileloc.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/c88b9e531c4e97c42cba7936ad538db0.png)

**手机定位:** Sattler 使用一张手机拍摄的图片来在一个大城市定位

**Related:** Scalable 6-DOF Localization on Mobile Devices. Sven Middelberg,
Torsten Sattler, Ole Untzelmann, Leif Kobbelt. In ECCV 2014.
[[pdf](https://www.graphics.rwth-aachen.de/publication/213/ECCV14_preprint.pdf)]  
**Related: **Torsten Sattler 's [The challenges of large-scale localisation and
mapping](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/Sattler_challenges_large_scale_loc_and_mapping.pdf) slides

### Talk 4：算法之争Feature-based vs Direct-Methods

ORB-SLAM的创造者Raúl
Mur-Artal使用了一整节讲座来讨论基于特征的方法与直接方法。当然咯，我们都知道他是特征方法阵营的。ORB-SLAM现在已经开源，而且看起来地位牢不可破。他对比了ORB-SLAM
与 PTAM，而后者常常失效（至少在TUM
RGB-D评价体系中）。并且在这个评价体系中LSD-SLAM的误差也很高，至少比我们期望的高。

![types-of-slam.jpg]({{site.zhehua.images}}/misc/tomasz_blog_slam/9f659fd009a4bc1e5d93bd61c1399ce7.jpg)

**基于特征 vs 直接方法**

详见[Should we still do sparse feature based
SLAM?](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/ICCV15_SLAMWS_RaulMur.pdf)

**Related:** Mur-Artal's [Should we still do sparse-feature based
SLAM?](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/ICCV15_SLAMWS_RaulMur.pdf) slides  
**Related:** Monocular ORB-SLAM R. Mur-Artal, J. M. M. Montiel and J. D. Tardos.
A versatile and Accurate Monocular SLAM System. IEEE Transactions on Robotics.
2015 [[pdf](http://webdiis.unizar.es/%7Eraulmur/MurMontielTardosTRO15.pdf)]  
**Related:** [ORB-SLAM Open-source code on
github](http://github.com/raulmur/ORB_SLAM), [Project
Website](http://webdiis.unizar.es/%7Eraulmur/orbslam/)

### Talk 5：谷歌Tango项目使用图像约束的回环检测

[Google's Project
Tango](https://www.google.com/atap/project-tango/)是世界范围第一次尝试大规模商业化SLAM的项目。Google
Zurich（前身 ETH Zurich)的Simon
Lynen用平板型Tango的创新功能做了现场展示。为防你还不知道，我还是告诉你——Google想让下一代安卓设备具有SLAM功能。

![Google-project-tango-3D-mapping-video.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/04e0227604a1e8971dbcd9c33989f95d.png)

Tango项目使用了基于帧间匹配矩阵的“Placeless Place
Recognition”方法，并在线基于视觉使用bundle adjustment做回环检测。

![placeless.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/38071219b23413f37ea3e6be60c38d99.png)

**Tango中的**回环检测： Lynen 等人的 [Placeless Place
Recognition](https://3234f89137bccf2ede29cc86e315c75116020d70.googledrive.com/host/0B64GJ60h3Ai1MVVwWTZwekhtcFU/publications/bib/lynen_3dv14.pdf).

使用帧间矩阵的新方法来做回环检测，详见[youtube
video](https://www.youtube.com/watch?v=HfWvWQrCwwA).

Tango项目组的人也结合Google内众包的地图源，目标是使用Tango这样的设备将许多由不同人群生成的小地图融合成大地图。

Simon演示了一个山路自行车轨迹跟踪视频，这在实际中还是比较困难的。这个点子首先是使用Tango用一次自行车轨迹建立地图，然后用另一个人在地图中定位。目前地图与定位间隔为几个小时，还做不到几周或几月。

在Tango项目的讨论中，Richard
Newcombe指出目前Tango理解环境使用的“特征”还比较原始，而且看起来它不能用在建筑不是那么正规，光照变化强烈的室外环境。那么，我们要设计一个用于室外的新系统呢，还是Tango只满足于成为室内专用的地图工具？

**Related: **[Placeless Place
Recognition.](https://3234f89137bccf2ede29cc86e315c75116020d70.googledrive.com/host/0B64GJ60h3Ai1MVVwWTZwekhtcFU/publications/bib/lynen_3dv14.pdf) Lynen,
S. ; Bosse, M. ; Furgale, P. ; Siegwart, R. In 3DV 2014.

**Related: **[Google I/O talk from May 29, 2015 about
Tango](https://www.youtube.com/watch?v=iP9m9a2KEN4)

### Talk 6：无姿态图的Dense SLAM ：Elastic Fusion

Elastic
Fusion是一种需要RGBD相机的稠密地图的SLAM技术。使用像Kinect这样的相机经过2-3分钟后得到房间内的高精度3D扫描数据。大多数SLAM系统都使用了姿态图模型，这项技术使用的是与map-centric不同的方法。它仍然需要建立地图，不过这种地图是变化的，所以称为Elastic
Fusion。其中的Fusion一词致敬的是一种基于kinect的高精度重建库KinectFusion。此外Elastic
Fusion还使用了surfel（**surf**ace **el**ement）。

![kintinuous.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/b6531326fdf849b98fd4c02cdb4327ce.png)

来源于Kintinuous,一种Elastic Fusion的早期版本

光源重建技术：我们还在会场抢先看到了来自帝国理工学院/Dyson机器人实验室的还未发表的新成果。它创新地检测光源的方向并检测镜面的反射，用来提高3D重建的效果。现场我们观看了使用4处光源的酷炫演示视频。

**Related: **[Map-centric SLAM with
ElasticFusion](http://wp.doc.ic.ac.uk/thefutureofslam/wp-content/uploads/sites/93/2015/12/ElasticFusion.pdf)
presentation slides  
**Related:** [ElasticFusion: Dense SLAM Without A Pose
Graph. ](http://www.doc.ic.ac.uk/%7Ebglocker/pdfs/whelan2015rss.pdf)Whelan,
Thomas and Leutenegger, Stefan and Salas-Moreno, Renato F and Glocker, Ben and
Davison, Andrew J. In RSS 2015.

### Talk 7：DynamicFusion

Richard
Newcombe（最近他创立的公司刚被Oculus收购）是最后一位演讲者。这位牛人有着高产的贡献（[DTAM](http://homes.cs.washington.edu/%7Enewcombe/papers/newcombe_etal_iccv2011.pdf),
[KinectFusion](http://homes.cs.washington.edu/%7Enewcombe/papers/newcombe_etal_ismar2011.pdf), [DynamicFusion](http://grail.cs.washington.edu/projects/dynamicfusion/papers/DynamicFusion.pdf)），如今开始为VR出力。

![dynamicfusion.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/322b9e463dbccacf97e4ad190eca58dc.png)

Newcombe的 [Dynamic
Fusion](http://grail.cs.washington.edu/projects/dynamicfusion/papers/DynamicFusion.pdf)算法.

这个发明拿到了2015年CVPR的最佳论文,

详见 [DynamicFusion Youtube video](https://www.youtube.com/watch?v=i1eZekcc_lM).

**Related**: [DynamicFusion: Reconstruction and Tracking of Non-rigid Scenes in
Real-Time](http://grail.cs.washington.edu/projects/dynamicfusion/papers/DynamicFusion.pdf),
Richard A. Newcombe, Dieter Fox, Steven M. Seitz. In CVPR 2015.
[[pdf](http://grail.cs.washington.edu/projects/dynamicfusion/papers/DynamicFusion.pdf)]
[Best-Paper winner]

**Related:** [SLAM++: Simultaneous Localisation and Mapping at the Level of
Objects](http://homes.cs.washington.edu/%7Enewcombe/papers/Salas-Moreno_etal_cvpr2013.pdf)
Renato F. Salas-Moreno, Richard A. Newcombe, Hauke Strasdat, Paul H. J. Kelly
and Andrew J. Davison (CVPR 2013)  
**Related:** [KinectFusion: Real-Time Dense Surface Mapping and
Tracking](http://homes.cs.washington.edu/%7Enewcombe/papers/newcombe_etal_ismar2011.pdf)
Richard A. Newcombe Shahram Izadi,Otmar Hilliges, David Molyneaux, David Kim,
Andrew J. Davison, Pushmeet Kohli, Jamie Shotton, Steve Hodges, Andrew
Fitzgibbon (ISMAR 2011, Best paper award!)

### 现场演示

在现场演示环境（整场研讨会中段），很多演讲者都现场展示了他们的SLAM系统。其中多数已经开源（商业使用免费吗？），要是你有兴趣可以下载测试看看。但是，现场唯一一个亮人眼球的演示是**Andrew
Davison**陈列的它在2004年发明的单目SLAM系统。Andy让它15岁的老笔记本抖擞精神，再次启动（运行的还是Redhat
Linux），用他当时使用的设备演示他当时的发明。如果计算机视觉领域要举办一个“古典视觉”展会，那我一定一马当先提名Andy拿最终优胜奖，现在就是！

![IMG\_0500.jpg]({{site.zhehua.images}}/misc/tomasz_blog_slam/627677851b999d62ad892c61f54e36f4.jpg)

Andy的古典视觉SLAM启动(Pictured on December 18th, 2015)

其实吧，在现场看SLAM领域的专家们用手举着USB相机的场景很有趣。他们使用这个相机现场演示围着桌子上的笔记本生成3D地图，但是如果你仔细地看他们移动相机的方式（那种慢悠悠的方式），你就基本可以看出这个人在SLAM领域工作多久了。要是一个新手举着相机，那跟踪失败的概率会高出很多。

我还在展示阶段同Andy愉快地交谈，我很好奇，在过去15年里哪一个成果最让你惊奇。他回答是PTAM，它使用的实时bundle
adjustment最让你记忆深刻。因为PTAM本质上实在原有单目SLAM进行改进，但它引入了一个重量级的算法（bundle
adjustment）使得SLAM可以实时化——这是他在21世纪初期不能预料的。

**第三节：深度学习 vs SLAM**

SLAM专题研讨会充满乐趣，但在我们开始谈深度学习 vs
SLAM之前，我应当提一下：每位与会者都同意，语义地图是构建更大更好的SLAM系统的关键。会上有很多对于未来走向的探讨（比较小型的），在讨论中，[Marc
Pollefeys](https://www.inf.ethz.ch/personal/marc.pollefeys/)（知名的SfM和多视几何专家）提醒大家——**机器人是SLAM的终极应用**，并且他建议我们应当实时关注最新进展。

这让大家感到惊讶，因为SLAM一开始就应用于机器人，但最近几十年没有什么特别成功的机器人得到应用（Google算吗？），这早已使得大家将目光从机器人移向了大规模地图（Google
Maps）与增强现实（Augmented Reality），没人在会上再谈机器人。

**将语义信息融入SLAM**

**将语义信息融入进当今表现最好的SLAM系统是一个充满乐趣的话题。但一提及语义信息，SLAM的研究者们就卡在视觉词袋(bags-of-visual-words)的世界里了,对如何将语义信息融入他们的系统缺乏新的点子。目前**CVPR/ICCV/ECCV**上许多人正尝试使用卷积神经网络，实时得到语义分割信息。从我的角度看，SLAM非常需要引入包括深度学习在内的其他方法。**

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\semantics.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/b0ce473721af5293d0c0a04678572625.png)

研究者常常说要向SLAM整合语义信息，但说得比做得容易咯

Figure 6.9 (page 142) from Moreno's PhD thesis: [Dense Semantic
SLAM](https://www.doc.ic.ac.uk/%7Erfs09/docs/Salas-Moreno-R-2014-PhD-Thesis.pdf)

**"端到端学习会取代 SLAM吗?"**

在SLAM专题研讨会的尾声，[Dr. Zeeshan
Zia](http://www.zeeshanzia.com/)问了一个问题，震惊全场并引发激烈讨论。你真应该来会上看看当时专家们的表情——就像一群几何学家突然碰到抛过来的叫做“深度学习”的火球。他们的表情夹着着迷茫、愤怒与反感，潜台词就是“你TM怎么敢这么问？”只有这个时刻，我们才体会到开会也是一场欢乐多的活动。Zia的问题是：**端到端学习未来会取代当今SLAM系统里大量的人工操作吗？**

Zia的问题非常重要，因为端到端训练的方法正逐步出现在许多计算机科学的高级议题中，SLAM也不会例外。有几位发言人指出，当今SLAM系统依赖于太多的几何问题，而这些是基于纯粹深度学习的系统还没法应用的——我们可以使用学习的方法来更好地提取特征描述子，而不去动几何的部分。*Just
because you can use deep learning to make a calculator, it doesn't mean you
should.*

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\convnet\_lecun\_stereo.png]({{site.zhehua.images}}/misc/tomasz_blog_slam/944a103f80c75ca933a61fc114cbd33b.png)

[Learning Stereo Similarity Functions](http://arxiv.org/abs/1409.4326) via
ConvNets, by Yan LeCun and collaborators.

当很多与会者给出肯定的”不会“的答案时，Newcombe给出了惊人的提议——应该结合深度学习与SLAM  
  
**Newcombe的提议: Use SLAM to fuel Deep Learning**  
尽管Newcombe没有提供足够的证据或理念来支撑深度学习如何促进SLAM，但他提供了另一条清晰的路——关于如何使用SLAM促进深度学习。想一想我们建立的大规模SLAM系统，其中能提取非常多的相关性——这不正是能够建立一个更大的”相关性“数据库，用来深度学习？这一理念的提出是基于当今的SLAM系统是一个大规模的”相关性引擎“，而这相当于能用于卷积神经网络的数据库。

**结尾**

当今主流的ICCV会议的机器学习方法与基于bundle
adjustment的几何方法的实时SLAM存在着很大的隔离。主流的计算机视觉领域已经见证了过去十年里一个又一个的小突破(e.g.,
Dalal-Triggs, DPM, ImageNet, ConvNets,
R-CNN)，而今日的SLAM系统至少看起来和8年前没什么变化。Kinect也许是这个领域唯一的变革，而其他主流算法仍然改变不大。

![C:\\Users\\Eden\\AppData\\Local\\Temp\\maftemp-495c5292\\1461305252607\_97\\134992626.jpg]({{site.zhehua.images}}/misc/tomasz_blog_slam/fa204c9867d4f64835c3fb893e48ec02.jpg)

结合语义信息：下一代视觉SLAM前端

Brain image from [Arwen
Wallington](http://wordpress.viu.ca/ciel/2013/01/23/gaming-and-student-disengagement/)'s
blog post.

今日的SLAM系统能使机器建立与当前坐标系的关系，而今日的深度学习系统能使机器区分不同物体的类别。总的来说，我和Newcombe
以及Davison持有对于视觉SLAM相同的观点，因为它即将走进增强现实（AR）和虚拟现实(VR)这样百十亿美元的市场。然而，我们也不要忘了关注将重新定义人类工作结构的千万亿美元的市场——机器人。属于SLAM机器人的一天终将到来。
