---
layout: post
title: "Markdown嵌入Mathematica"
category: 工具链
tags: 
    效率工具链
keywords: 
description: 
---

## 绪论

CDF（Computable Document Format）是Mathematica提供的交互式插件，在强数学的笔记中，比IPython有优势。

> Wolfram 语言笔记本与 .cdf 文件的主要不同之处是在 CDF Player 中查看文档时的交互许可程度不同. 笔记本文件（文件扩展名为 .nb）在 CDF Player 中只能作为静止文档查看，而 .cdf 文件中的 Manipulate 对象（或其他动态元素）在 CDF Player 中查看时是可以完全交互的.

对于作者：[如何嵌入CDF到网页](http://reference.wolfram.com/language/howto/CreateAComputableDocumentFormatFile.html)

对于读者：下载Mathematica免费的CDF软件，安装后，在浏览器允许插件运行，即可显示

## 注意
本博客点击博文链接后会先进入示例界面，浏览器点击“退回”后才会返回博文。

---
## 示例

<script type="text/javascript" src="http://www.wolfram.com/cdf-player/plugin/v2.1/cdfplugin.js"></script>
<script type="text/javascript">
var cdf = new cdfplugin();
cdf.setDefaultContent('<a href="http://www.wolfram.com/cdf-player/"><img  src="{{site.zhehua.files}}/CDFTest.png"></a>');
cdf.embed('{{site.zhehua.files}}/CDFTest.cdf', 635, 913);
</script>

