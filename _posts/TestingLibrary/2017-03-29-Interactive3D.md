---
layout: post
title: "三维选择图像"
category: 测试库
tags: demo
keywords: 
description: 
---

{{site.zhehua.public}}/js/jquery.interactive_3d.js

<html>
<head>
	<meta charset="utf-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="{{site.zhehua.public}}/js/jquery.interactive_3d.js"></script>
  <style>
    body {
      text-align: center;
    }
	</style>
	<script>
	  $(document).ready( function() {
	    $("#i3d").interactive_3d({
	      frames: 38
	    });
	  });

	</script>
</head>
<body>
  <div id="i3d" class="interactive_3d">
    <img src="/assets/images/misc/3d/frame_1.png">
  </div>
</body>
</html>


<html>
<head>
	<meta charset="utf-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript" src="/public/js/jquery.interactive_3d.js"></script>
  <style>
    body {
      text-align: center;
    }
	</style>
	<script>
	  $(document).ready( function() {
	    $("#i3d").interactive_3d({
	      frames: 38
	    });
	  });

	</script>
</head>
<body>
  <div id="i3d" class="interactive_3d">
    <img src="/assets/images/misc/3d/frame_1.png">
  </div>
</body>
</html>

