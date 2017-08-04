---
layout: post
title: "卷积与相关: Convolution & Correlation"
category: 读学观
tags: 
    读学观
keywords: 
description: 
---


## 感性描述：


-   你每秒被打击一次【pulse input】

-   每一次被打，疼痛是时间t的函数**【h(t)，pulse response】,**

>   比如疼痛短时间上升到最高，然后逐渐减弱，

-   求施以任意的打击【x(t)】后，你的疼痛值。

![]({{site.zhehua.images}}/conv_imgs/image2.png)

>   x(t)


![]({{site.zhehua.images}}/conv_imgs/e8622eb9315e89b11f940e645eda7b1f.png)

## 梳理

 
在系统分析中， 系统输入/输出和系统特性的作用关系在时间域就体现为卷积积分的关系

![]({{site.zhehua.images}}/conv_imgs/c957a6888e3c62534f6bebb5a8cea117.png)

 
对 于 线 性 系 统 而 言 ， 系 统 的 输 出 (O) 是 任 意 输 入 x(t) 与 系 统 脉 冲 响 应 函 数 h （ 0 的 卷 积 · (1) 将 信 号 ） 分 解 为 许 多 宽 度 为 At 的 窄 条 面 积 之 和 ， t=nAt 时 的 第 n 个 窄 条 的 高 度 为 佃 \^ 0 在 At 趋 近 于 零 的 情 况 下 ， 窄 条 可 以 看 作 是 强 度 等 于 窄 条 面 积 的 脉 冲 “ x(nåt)åt 
![]({{site.zhehua.images}}/conv_imgs/cc12643de6d329eed39022639c6518fb.png)

 

 

-   **任意输入都可以离散为一系列点【pulse】**

![（ 2 ） 根 据 线 性 系 统 特 性 ， 在 t ： 黿 t 时 刻 ， 窄 条 脉 冲 引 起 的 响 应 为 ． № ' 砌 凼 0 ' 砌 0 ]({{site.zhehua.images}}/conv_imgs/1518275aff92c8195311450d49a8fb40.png)

 

![（ 3 ） 根 据 线 性 系 统 的 叠 加 原 理 ， 各 脉 冲 引 起 的 响 应 之 和 即 为 输 出 y （ 0 巛 的 (t)A 到 地 一 nAt) 0 ]({{site.zhehua.images}}/conv_imgs/acd09fc48dafaac5e484a96172fe0864.png)

 

**当△t -\> ∞**

![y(t) x(r)h(t r)dr h(t) ]({{site.zhehua.images}}/conv_imgs/78f20016ff09a77f51e9dc450e14e643.png)

-   **其中h(t-τ) ,τ是零时刻冲击响应 h(0）右移的距离**

-   **时间翻转指的是,只计算 t时刻前的影响**

 

**3.小结**

 

**卷积为 ：在输入信号的每个位置，叠加一个单位响应，最后产生输出信号**

 

**Motion Demo**

![]({{site.zhehua.images}}/conv_imgs/56c93999c75d2b6668eb1854a74cd36b.png)

 

![]({{site.zhehua.images}}/conv_imgs/86bcc9d2397f6710781e3fc72762fefe.png)

 

![]({{site.zhehua.images}}/conv_imgs/25707d9f37d7f2c447eff3b32e597e9f.png)

 

![]({{site.zhehua.images}}/conv_imgs/e45b0036eb9c22ccd98418fc14cb6249.png)

 
![]({{site.zhehua.images}}/conv_imgs/Convolution_of_box_signal_with_itself2.gif)


 

## 相关

####  1.感性

 

![你 要 向 右 走 ． 《 我 也 向 右 走 有 正 的 和 关 自 由 ， 与 你 无 关 不 相 关 你 要 向 右 走 ， 我 就 向 左 走 J 有 负 的 相 关 图 3 ． 8 相 关 函 数 的 含 又 ]({{site.zhehua.images}}/conv_imgs/d0383e88a9f6f5fc08a7c54ece2e04a9.png)

####  2.离散变量的相关描述
1 变 量 相 关 的 概 念 统 计 学 中 用 相 关 系 数 来 描 述 变 量 x ， y 之 间 的 相 关 性 。 是 两 随 机 变 之 积 的 数 学 期 望 ， 称 为 相 关 性 ， 表 征 了 x 、 y 之 间 的 关 联 程 度 。
![]({{site.zhehua.images}}/conv_imgs/9ce8ff8d44091ab4728e5576eed9200d.png)

 

 

####  连续/函数相关

![如 果 所 研 究 的 变 量 x ， y 是 与 时 间 有 关 的 函 数 ， 即 x (t) 与 y (t) ： x (t) ]({{site.zhehua.images}}/conv_imgs/c6f10a75d7efc0fe0995ea661874a415.png)

 

![这 时 可 以 引 入 一 个 与 时 间 有 关 的 量 ， 称 为 函 数 的 相 关 系 数 ， 简 称 相 关 函 数 ， 并 有 ： [ 了 谳 了 ，2\@渖]。2 相 关 函 数 反 映 了 二 个 信 号 在 时 移 中 的 相 关 性 。 x(t) y (t) ]({{site.zhehua.images}}/conv_imgs/3b26c95ccea4ff9d549110d575d08ac8.png)

-   同一个函数的“互相关”为“自相关”

>   [{{site.zhehua.images}}/conv_imgs/image19.png]({{site.zhehua.images}}/conv_imgs/image19.png)

>   算 法 ： 令 x （ t 〕 、 y 〈 t ） 二 个 信 号 之 间
>   产 生 时 差 “ 再 相 乘 和 积 分 ， 就 可 以 得 到 时 刻 二 个 信 号 的 相 关
>   性 。 X(t)y(t-T) 积 ， 倒 乘 法 器 分 时 延 器 自 相 关 函 数 ： x (t) =y
>   (t)

>    

>   [{{site.zhehua.images}}/conv_imgs/image20.png]({{site.zhehua.images}}/conv_imgs/image20.png)

>   相 关 分 析 的 工 程 应 用 案 例 ： 机 械 加 工 表 面
>   粗 糙 度 自 相 关 分 析 被 測 工 件 相 关 分 析 性 质 3 ， 性 质 4 ： 兮 提
>   取 出 回 转 误 差 等 周 期 性 的 故 障 源 ；

 

![案 例 ： 自 相 关 测 转 速 理 想 信 号 干 扰 信 号 性 质 3 ， 性 质 4 ： 提 取 周 期 性 转 速 成 分 。 ]({{site.zhehua.images}}/conv_imgs/1d49e7fac5296612d33aac2a6545cf0e.png)

 

![案 例 ： 地 下 输 油 管 道 漏 损 位 置 的 探 测 ]({{site.zhehua.images}}/conv_imgs/efb08dfc2369e0251ddefa372a1e5421.png)

 

 

####  数学表达

>   离散

![+ u J 区 ]({{site.zhehua.images}}/conv_imgs/a51f7199a24ff06a00f17a2160be6999.png)

>   连续

![]({{site.zhehua.images}}/conv_imgs/79ecd49527bf8eaaeef207bd2c30921f.png)

 

![相 关 函 数 的 性 质 相 关 函 数 描 述 了 两 个 信 号 间 或 信 号 自 身 不 同 时 刻 的 相 似 程 度 ， 通 过 相 关 分 析 可 以 发 现 信 号 中 许 多 有 规 律 的 东 西 。 (1) 自 相 关 函 数 是 t 的 偶 函 数 ， R (t) 一 t 〕 ； （ 2 ） 当 亻 = 0 时 ， 自 相 关 函 数 具 有 最 大 值 。 （ 3 ） 周 期 信 号 的 自 相 关 函 数 仍 然 是 同 頻 率 的 周 期 信 号 ， 但 不 保 留 原 信 号 的 相 位 信 息 。 （ 4 ） 随 机 噪 声 信 号 的 自 相 关 函 数 将 随 t 的 增 大 快 速 衰 减 。 ]({{site.zhehua.images}}/conv_imgs/215ddbaad01f579dfe8778ffea13cfbd.png)

 

![（ 5 ） 两 周 期 信 号 的 互 相 关 函 数 仍 然 是 同 频 率 的 周 期 信 号 ， 且 保 留 原 了 信 号 的 相 位 信 息 。 （ 6 ） 两 个 非 同 頻 率 的 周 期 信 号 互 不 相 关 。 ]({{site.zhehua.images}}/conv_imgs/0799bc89e0064077007ce5e4f9e97aaf.png)

 
#### 二维引入

![]({{site.zhehua.images}}/conv_imgs/ba95a1781f06287f20317529ca049149.png)
 

## 小结

![Convolution Cross-correlation Autocorrelation مكالكالك ك «اككلا ميك ح ل ه لم تلا ه هلا ل ]({{site.zhehua.images}}/conv_imgs/d763c3a58c825b2dc61425f7c7d50b75.png)

 

 

 



 
