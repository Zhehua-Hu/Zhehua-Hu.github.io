---
layout: post
title: "Markdown嵌入Mathematica"
category: 工具链
tags: 
    效率工具链
keywords: 
description: 
---

##绪论

CDF（Computable Document Format）是Mathematica提供的交互式插件，在强数学的笔记中，比IPython有优势。

对于作者：[如何嵌入CDF到网页](http://reference.wolfram.com/language/howto/CreateAComputableDocumentFormatFile.html)

对于读者：下载Mathematica免费的CDF软件，安装后，在浏览器允许插件运行，即可显示


## 示例

<script type="text/javascript" src="http://www.wolfram.com/cdf-player/plugin/v2.1/cdfplugin.js"></script>
<script type="text/javascript">
var cdf = new cdfplugin();
cdf.setDefaultContent('<a href="http://www.wolfram.com/cdf-player/"><img  src="{{site.zhehua.files}}/CDFTest.png"></a>');
cdf.embed('{{site.zhehua.files}}/CDFTest.cdf', 635, 913);
</script>

