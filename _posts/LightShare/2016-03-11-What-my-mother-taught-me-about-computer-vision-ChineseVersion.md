---
layout: post
title: "妈妈教我走向计算机视觉[译]"
category: 轻分享
tags: 
    宾主集赋
keywords: 
description: 
---

## 简介
博客作者 Tomasz Malisiewicz 是MIT Computer Science and Artificial Intelligence 
Laboratory 的博士后，卡内基梅隆大学Robotics的PhD，Physics/CS的本科。是vision.ai的联合创始人，
他的博客主要内容一览（截至今日）：

* 2015嵌入式视觉峰会：Dyson 360 Eye与 百度深度学习

* ICCV 2015——21篇最热论文

* Mobileye将引入深度学习到每辆新车中

* 三个维度思考机器学习系统

* 从特征描述子到深度学习：回顾20年计算机视觉

* 实时SLAM的未来,深度学习 vs SLAM

* 最佳视觉数据应用

* 深入无底洞：CVPR 2015

* 深度学习2015淘金热

* 深度学习 Vs 大数据

* 深度学习 Vs 机器学习 Vs 模式识别

* 深度学习 Vs 概率图模型 Vs 逻辑学

---
下文分享给读者

## 译文《妈妈教我走向计算机视觉》
“醒来吧，*Tomek。背上行李，我们朝美国出发。“*

这是某一天，妈妈把我从熟睡中唤起时，萦绕在我耳边的话语。
那时生活中还没有闹钟与备忘录。那是1992年，波兰的一个普通星期一，而我才八岁。
如果不算几年前一次短暂的捷克斯洛伐克之行，我就没有离开过波兰。

但我仍深深记得这句话，它总在耳边回响。
深深记得当时母亲给予一个刚醒来的孩子的关怀，还有对未来的期待。
这几小时让我印象深刻，即使之后我体验到了人生第一次的跨国航班、
第一次的看到多车道的马路，第一次逛大商场还有第一次沉浸在多样的美国电视节目中。

妈妈教给我的是，有时候你需要的仅仅是背起行囊上路。
这堂课是大学无法教给我的，这是妈妈言传身教的。
而这却是最影响我一生的时刻——让我从波兰向机会的国度出发——至今都让我激动得无以言表。

在人生中做出如此冒险的行为之后，我想妈妈的内心也是无比激动的。
这个选择需要很大的勇气，需要企业家精神的支撑，更需要承担风险的信念与拥抱未来的眼光。未来充满不确定性，但当你倾心于未来无尽的希望时，你将愈加强大，不可战胜。

妈妈不会教我量子力学，事实上，她从未给我学习辅导，以让我考上一所好大学。
当然，更没有能力让我进入一个好的项目组去读博士，教我如何成为一个有礼貌，
受人尊敬的科学家。但是，她给了我勇气与信心，让我明了——如果你想拥有期待的生活，
或追求什么，只要你用心脚踏实地去做，那一定可以得到！
**妈妈言传身教展现的勇气，给我上了最好的一节课，至今远胜任何我学到的其他知识。**
谢谢你，妈妈！

计算机视觉是未来的方向，它充满不确定性的挑战。
它一定需要企业家精神，而这不能从惬意的象牙塔中得到。
我预见到，未来我们与机器间的交互，一定与现在大不相同。
**我预见到，未来我们将不再是手机的奴隶，高阶智能允许我们拥抱真正属于人的本性。**
这样的未来里，科技会把我们从当今充斥着压力与焦虑的生活中解放出来。
而计算机视觉，正是这样美好未来的窗口。
它让我们用更接近本真的方式与机器交互，如同它们本来就是自然环境的一部分。

但是，这种改变如若我们的心态不改变，一定不会发生。
在2013年，计算机视觉仍然局限在学术圈子。
多是为了研究而研究，竞相发布晦涩的文章，通过比较无谓的数字指标来展示做出的改进。
从学术上来看，我们已经走了很远，但我们应该再迈得更远。
我们要解放自己，不要再担忧自己的简历还不够好看。

我根本就不信这种大迈步会自己发生。我想要计算机视觉能给我们与它们的交互更上一层楼。
**我坚信计算机视觉是机遇所在，如同多年前我如此看待美国。**
计算机视觉是未来的走向，是引导浪潮的科技。
但如若我仍然仅把自己当做一位学者，那就白费了我期待的一切。
我深知如今我的生活会比选择学术的道路更加坎坷。
**虽然有些说不清道不明，但我不得不承认，我离开MIT的那天比我到MIT的那天更激动。**
我确实很激动，同我一起的伙伴们也是如此。而当我们的产品发布后，我们期待你也会同样激动。

我想，有趣的生活才刚开始，我们唯一的镣铐，是自己施加的。

“醒来吧，*计算机视觉。背上行李，我们走向每户人家。“*

---
## 原文[链接](http://www.computervisionblog.com/2013/12/what-my-mother-taught-me-about-computer.html?utm_source=tuicool&utm_medium=referral)
**What my mother taught me about computer vision**

*“Wake up, Tomek.  Pack your bags.  We’re moving to America.” *

These were the words my mother whispered into my ear as she roused me from a
deep sleep.  There was no alarm clock and no preparation (at least not on my
behalf). I was eight years old, and it was a typical January morning in Poland. 
It was 1992, and beside a brief venture into Czechoslovakia a few years earlier,
I had never left Poland before.

I can still remember those words like they were uttered yesterday.  I remember
both the comfort of a child being woken up by the reassuring words of one’s
mother as well as the excitement of what those words meant.  It was a matter of
hours until I would experience my first international flight, my first
multi-lane highway, my first supermarket, and get my first dose of American
television.

What I learned from my mother is that sometimes, you just have to pack your bags
and go.  That is the lesson my mother taught me, and it wasn’t delivered in the
form of a university lecture.  It was an action.  An action that would be the
single most influential event in my life.  Moving to the Land of Opportunity
from Poland wasn’t something you could not be excited about.

There is a certain kind of excitement that occurs when you make such a bold move
in your life.  It requires a certain kind of courage, a certain kind of
entrepreneurial spirit.  A certain vision for the future and a certain
willingness to take a calculated risk.  A vision that might be filled with
uncertainty, but when the uncertainty is drowned by hope, any residual fear just
melts away.

My mother never taught me anything about quantum mechanics.  She never provided
me with extra tutors hat would one day help me get into a good college, no
guidance on how to get into a great PhD program, no etiquette lessons on how to
become a respected scientist, etc.  But she gave me the courage and confidence
to know that if you want something in life and you have the willingness to
pursue it, you can get it. **The courage that my mother's actions instilled in
me have been more influential in my personal development than any single formal
source of knowledge so far. ** Thanks mom.

Computer vision is all about the future.  It is all about risks.  It requires a
certain entrepreneurial spirit that cannot be attained within the comfy confines
of the ivory tower.  I see a world where the way we interact with machines is
drastically different than today.  **I see a future where we are no longer
slaves to our smartphones, where automation will allow us to embrace our human
side**.  A future where technology will allow us to be free from the worries and
stresses which saturate contemporary life.  Computer vision is the interface of
the future.  It will allow for both machines to make sense of the world around
them, and for us to interact with these machines in a much more intuitive way.

But this sort of change cannot happen without a change in attitude.  As of
December 2013, computer vision is simply too academic.  Too much mathematics
simply for the sake of mathematics.  Too much emphasis on advancing the
state-of-the-art by writing esoteric papers and competing on silly benchmarks. 
As a community we have made tremendous advancements, but we have to take more
risks.  We have to let go of our egos, and stop worrying about our individual
resumes.

I no longer believe that the sort of change I want to see in the world is going
to happen by itself.  I want computer vision to revolutionize the way we
interact with computers.  **I believe in Computer Vision the same way I believed
(and still do) about America.** Computer vision is the technology of the future,
it is the technology of opportunity.  But this cannot happen as long as I
continue to portray myself as solely an academic figure.  I know that the way
I’m approaching life now is much riskier than getting a traditional job/career
in the sciences.  **It’s strange to admit that my last day at MIT has been much
more exciting for me than my first day at MIT.**  I am excited.  My fledgling
team is excited.  After our product launch, we’re hoping you will participate in
our excitement.  I think the fun times are only beginning. The only limits we
have are the ones we impose upon ourselves. 

*“Wake up computer vision.  Pack your bags.  You’re moving into everyone’s
home.” *
